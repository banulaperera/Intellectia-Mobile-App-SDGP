import 'package:client/constants.dart';

import 'package:client/models/note_model.dart';

import 'package:flutter/Material.dart';

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
          if (titleController.text.isEmpty) {
            return;
          }

          if (bodyController.text.isEmpty) {
            return;
          }

          Navigator.pop(context, [titleController.text, bodyController.text]);
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}
