import 'package:bootstrap_icons/bootstrap_icons.dart';

import 'package:client/constants.dart';

import 'package:client/models/note_model.dart';

import 'package:client/note_editor.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = List.empty(growable: true);

  List<Note> filteredNote = List.empty(growable: true);
  @override
  void initState() {
    super.initState();

    filteredNote = notes;
  }

  void search(String text) {
    setState(() {
      filteredNote = notes
          .where((element) =>
              element.body.toLowerCase().contains(text.toLowerCase()) ||
              element.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notes',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
                IconButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      BootstrapIcons.filter,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: search,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),

                hintText: "Search",

                suffixIcon: const Icon(Icons.search),

// prefix: Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                itemCount: filteredNote.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      final value = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => CreateNote(
                            notes: filteredNote[index],
                          ),
                        ),
                      );

                      if (value != null) {
                        setState(
                          () {
                            int firstNote = notes.indexOf(filteredNote[index]);

                            notes[firstNote] = Note(
                                title: value[0],
                                body: value[1],
                                modifiedTime: DateTime.now());

                            filteredNote[firstNote] = Note(
                                title: value[0],
                                body: value[1],
                                modifiedTime: DateTime.now());
                          },
                        );
                      }
                    },
                    child: Card(
                      color: cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredNote[index].title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              filteredNote[index].body,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Edited: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(filteredNote[index].modifiedTime)}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: kPrimaryColor,
        shape: const CircleBorder(),
        onPressed: () async {
          final value = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CreateNote(),
            ),
          );

          if (value != null) {
            setState(
              () {
                notes.add(
                  Note(
                      title: value[0],
                      body: value[1],
                      modifiedTime: DateTime.now()),
                );

                filteredNote = notes;
              },
            );
          }
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
