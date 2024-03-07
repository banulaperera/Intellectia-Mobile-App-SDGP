import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/models/tile_model.dart';
import 'package:client/models/note_dto.dart';
import 'package:client/repository/note_repository.dart';
import 'package:client/screens/home_page/home_page_components/tile_view_widget.dart';
import 'package:client/screens/home_page/home_page_components/note_editor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<NoteDTO> notes = List.empty(growable: true);
  List<TileModel> filteredNotes = List.empty(growable: true);
  List<TileModel> tileList = List.empty(growable: true);
  String moduleName = '';

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final List<NoteDTO> allNotes = await NoteRepository().getAllNotes() ?? [];
    setState(() {
      Set<String> uniqueModuleNames = <String>{};
      for (final note in allNotes) {
        uniqueModuleNames.add(note.moduleName);
      }
      tileList.clear();
      for (final moduleName in uniqueModuleNames) {
        List<NoteDTO> moduleNotes =
            allNotes.where((note) => note.moduleName == moduleName).toList();
        tileList.add(TileModel(title: moduleName, tiles: moduleNotes));
      }
      filteredNotes = tileList;
    });
  }

  void search(String text) {
    setState(() {
      filteredNotes = tileList
          .where((tile) =>
              tile.title.toLowerCase().contains(text.toLowerCase()) ||
              tile.tiles.any((note) =>
                  note.content.toLowerCase().contains(text.toLowerCase()) ||
                  note.title.toLowerCase().contains(text.toLowerCase())))
          .map((tile) {
        if (tile.title.toLowerCase().contains(text.toLowerCase())) {
          return TileModel(
            title: tile.title,
            tiles: tile.tiles,
          );
        } else {
          return TileModel(
            title: tile.title,
            tiles: tile.tiles
                .where((note) =>
                    note.content.toLowerCase().contains(text.toLowerCase()) ||
                    note.title.toLowerCase().contains(text.toLowerCase()))
                .toList(),
          );
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
        child: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: fetchNotes,
          child: Column(
            children: [
              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: appBarTitleSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: search,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15),
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<void>(
                  future: NoteRepository().getAllNotes(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ), // Loading animation
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Lottie.asset(
                              'animations/Animation - 1709835838086.json',
                              height: 300,
                              reverse: true,
                              repeat: true,
                              animate: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Something went wrong: ${snapshot.error}',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView(
                        padding: const EdgeInsets.only(top: 15),
                        children: filteredNotes
                            .map((tile) => TileViewWidget(tile: tile))
                            .toList(),
                      );
                    }
                  },
                ),
              ),
              // Expanded(
              //   child: ListView(
              //     padding: const EdgeInsets.only(top: 15),
              //     children: filteredNotes
              //         .map((tile) => TileViewWidget(tile: tile))
              //         .toList(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: kPrimaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CreateNote(),
            ),
          );
        },
        child: const Icon(
          BootstrapIcons.plus,
          color: Colors.white,
          size: 38,
        ),
      ),
    );
  }
}
