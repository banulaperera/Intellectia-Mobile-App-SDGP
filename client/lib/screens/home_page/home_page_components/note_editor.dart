// import 'dart:math';

import 'package:client/constants.dart';
// import 'package:client/home_page.dart';

import 'package:client/models/note_model.dart';
import 'package:client/screens/home_page/home_page.dart';

import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  final Note? notes;

  const CreateNote({super.key, this.notes});
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.notes != null) {
      titleController = TextEditingController(text: widget.notes!.title);

      bodyController = TextEditingController(text: widget.notes!.body);
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
                controller: bodyController,
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
          // if (titleController.text.isEmpty) {
          //   return;
          // }

          // if (bodyController.text.isEmpty) {
          //   return;

          // Navigator.pop(context, [titleController.text, bodyController.text]);
          moduleNamePopUp(context);
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }

  // void moduleNamePopUp(BuildContext context) => showDialog(
  //     context: context,
  //     builder: (context) => const AlertDialog(
  //           title: Text('Module Name'),
  //           content: TextField(
  //             decoration: InputDecoration(hintText: 'Custom Module Name'),
  //           ),
  //           // actions: [TextButton(onPressed: submit, child: Text('Apply'))],
  //         ));

  void moduleNamePopUp(BuildContext context) => showDialog(
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
                    goBackToHomePage();
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
                    goBackToHomePage();
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
                    goBackToHomePage();
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
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a module name',
                  // filled: true,
                  // fillColor: Colors.grey,
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide.none,
                  //     borderRadius: BorderRadius.circular(10))
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  goBackToHomePage();
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

  void goBackToHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }
}
