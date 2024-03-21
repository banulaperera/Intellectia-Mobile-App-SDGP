import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/controllers/note_controller.dart';
import 'package:client/screens/home_page/home_page_components/note_editor.dart';
import 'package:client/screens/home_page/home_page_components/tile_view_widget.dart';
import 'package:client/util/connection_lost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.put(NoteController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
        child: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: () async {
            await noteController.fetchNotes();
          },
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
                key: const Key('searchKey'),
                onChanged: noteController.search,
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
                  future: noteController.fetchNotes(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ), // Loading animation
                      );
                    } else if (snapshot.hasError) {
                      return connectionLost();
                    } else if (noteController.filteredNotes.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Lottie.asset(
                            'animations/Animation - 1710410924292.json',
                            height: 120,
                            reverse: true,
                            repeat: true,
                            animate: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              textAlign: TextAlign.center,
                              'No Notes Found',
                              // 'Add Notes to get started!',
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return GetBuilder<NoteController>(
                        builder: (builder) {
                          return ListView(
                            padding: const EdgeInsets.only(top: 15),
                            children: noteController.filteredNotes
                                .map((tile) => TileViewWidget(tile: tile))
                                .toList(),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
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