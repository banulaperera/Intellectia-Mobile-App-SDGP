import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/models/tile_model.dart';
import 'package:client/repository/note_repository.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TileViewWidget extends StatefulWidget {
  final TileModel tile;
  const TileViewWidget({super.key, required this.tile});

  @override
  State<TileViewWidget> createState() => _TileViewWidgetState();
}

class _TileViewWidgetState extends State<TileViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                                    NoteRepository()
                                        .deleteNote(note.id.toString());
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
                        ? 'Created: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(note.createdDate)}'
                        : 'Edited: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(note.lastModifiedDate)}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () {
                    // Add your onTap logic here
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
