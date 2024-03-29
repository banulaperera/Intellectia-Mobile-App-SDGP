import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/models/tile_model.dart';
import 'package:client/screens/home_page/home_page_components/note_editor.dart';
import 'package:client/util/constants.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/note_controller.dart';
import '../../../util/screen_dimension.dart';

class TileViewWidget extends StatefulWidget {
  final TileModel tile;

  const TileViewWidget({super.key, required this.tile});

  @override
  State<TileViewWidget> createState() => _TileViewWidgetState();
}

class _TileViewWidgetState extends State<TileViewWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      // 1% of screen height
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        shape: const Border(),
        trailing: const SizedBox(),
        key: PageStorageKey(widget.tile),
        title: Text(
          widget.tile.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: widget.tile.tiles
            .map(
              (note) => Slidable(
                endActionPane: ActionPane(
                  extentRatio: .2,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: kBackgroundColor,
                              title: const Text('Delete Note'),
                              content: const Text(
                                  'Are you sure you want to delete this note?'),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  onPressed: () {
                                    Get.find<NoteController>()
                                        .deleteNoteById(note.id.toString());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: BootstrapIcons.trash3_fill,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red.withOpacity(0.5),
                    )
                  ],
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        note.content,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    note.createdDate == note.lastModifiedDate
                        ? 'Created: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(note.createdDate.toUtc())}'
                        : 'Edited: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(note.lastModifiedDate.toUtc())}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => CreateNote(
                          notes: note,
                        ),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height * 0.01,
                      horizontal: width *
                          0.04), // 1% of screen height and 4% of screen width
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
