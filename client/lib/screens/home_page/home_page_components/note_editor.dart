import 'package:client/constants.dart';
import 'package:client/models/note_dto.dart';
import 'package:client/repository/note_repository.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

import '../../navigation_bar.dart';

class CreateNote extends StatefulWidget {
  final NoteDTO? notes;

  const CreateNote({super.key, this.notes});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController customerModuleNameController = TextEditingController();

  @override
  void initState() {
    if (widget.notes != null) {
      titleController = TextEditingController(text: widget.notes!.title);
      contentController = TextEditingController(text: widget.notes!.content);
      customerModuleNameController =
          TextEditingController(text: widget.notes!.moduleName);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Expanded(
          child: ListView(
            children: [
              TextFormField(
                key: const Key('title'),
                controller: titleController,
                maxLines: null,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                key: const Key('content'),
                controller: contentController,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something...',
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
          if (titleController.text.isEmpty) {
            return;
          }

          if (contentController.text.isEmpty) {
            return;
          }
          // Navigator.pop(context, [titleController.text, contentController.text]);
          moduleNamePopUp(
              context, titleController.text, contentController.text);
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }

  void moduleNamePopUp(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: const Text(
                'Module Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              contentPadding: const EdgeInsets.all(25),
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: SimpleDialogOption(
                    child: const Text('Option 1'),
                    onPressed: () {
                      // goBackToHomePage();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: SimpleDialogOption(
                    onPressed: () {
                      // goBackToHomePage();
                    },
                    child: const Text('Option 2'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: SimpleDialogOption(
                    onPressed: () {
                      // goBackToHomePage();
                    },
                    child: const Text('Option 3'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Custom Module Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: customerModuleNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter a module name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    goBackToHomePage(
                        customerModuleNameController.text, title, content);
                  },
                  backgroundColor: kPrimaryColor,
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ));
  }

  void goBackToHomePage(String moduleName, String title, String content) {
    if (widget.notes != null) {
      NoteRepository().updateNote(NoteDTO(
          id: widget.notes!.id,
          moduleName: moduleName,
          createdDate: widget.notes!.createdDate,
          lastModifiedDate: DateTime.now(),
          title: title,
          content: content));
    } else {
      NoteRepository().addNote(NoteDTO(
          moduleName: moduleName,
          createdDate: DateTime.now(),
          lastModifiedDate: DateTime.now(),
          title: title,
          content: content));
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const BottomNavigation()));
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    customerModuleNameController.dispose();
    super.dispose();
  }
}