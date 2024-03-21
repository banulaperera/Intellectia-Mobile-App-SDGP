import 'package:client/constants.dart';
import 'package:client/controllers/ml_model_controller.dart';
import 'package:client/models/note.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/note_controller.dart';
import '../../../util/connection_lost.dart';
import '../../navigation_bar.dart';

class CreateNote extends StatefulWidget {
  final Note? notes;

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

  final noteController = Get.find<NoteController>();
  MlModelController mlModelController = Get.put(MlModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: ListView(
          children: [
            TextFormField(
              key: const Key('title'),
              controller: titleController,
              maxLines: null,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
          mlModelController.getModules(contentController.text);
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
        backgroundColor: kBackgroundColor,
        title: const Text('Module Name',
            style: TextStyle(fontWeight: FontWeight.bold)),
        contentPadding: const EdgeInsets.all(25),
        children: [
          FutureBuilder(
              future: mlModelController.getModules(content),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(color: kPrimaryColor));
                } else if (snapshot.hasError) {
                  return connectionLost();
                } else {
                  if (mlModelController.predictedModules.isEmpty) {
                    return const Center(child: Text('No modules found'));
                  } else {
                    return Column(
                      children: List.generate(
                        3,
                            (index) => Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                          child: GetBuilder<MlModelController>(
                            builder: (context) {
                              return SimpleDialogOption(
                                child: Text(
                                    mlModelController.predictedModules[index]),
                                onPressed: () {
                                  if (widget.notes != null) {
                                    noteController.updateNote(
                                        widget.notes!.id.toString(),
                                        widget.notes!.createdDate,
                                        mlModelController.predictedModules[index],
                                        title,
                                        content);
                                  } else {
                                    noteController.addNote(
                                        mlModelController.predictedModules[index],
                                        title,
                                        content);
                                  }
                                  Get.to(() => const BottomNavigation(0));
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                }
              }),
          const SizedBox(height: 20),
          const Text('Custom Module Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(
              controller: customerModuleNameController,
              decoration:
                  const InputDecoration(hintText: 'Enter a module name')),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              if (widget.notes != null) {
                noteController.updateNote(
                    widget.notes!.id.toString(),
                    widget.notes!.createdDate,
                    customerModuleNameController.text,
                    title,
                    content);
              } else {
                noteController.addNote(
                    customerModuleNameController.text, title, content);
              }
              Get.to(() => const BottomNavigation(0));
            },
            backgroundColor: kPrimaryColor,
            child: const Text('Apply',
                style: TextStyle(
                    color: Color.fromARGB(255, 252, 252, 252), fontSize: 16)),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    customerModuleNameController.dispose();
    super.dispose();
  }
}
