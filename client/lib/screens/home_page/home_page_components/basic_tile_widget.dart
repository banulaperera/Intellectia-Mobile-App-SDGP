import 'package:client/constants.dart';
import 'package:client/models/basic_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicTileWidget extends StatefulWidget {
  final BasicTile tile;
  const BasicTileWidget({super.key, required this.tile});

  @override
  State<BasicTileWidget> createState() => _BasicTileWidgetState();
}

class _BasicTileWidgetState extends State<BasicTileWidget> {
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
              (note) => InkWell(
                onTap: () => print('hello'),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
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
                        const SizedBox(height: 2),
                        Text(
                          note.createdDate == note.lastModifiedDate
                              ? 'Created: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(note.createdDate)}'
                              : 'Edited: ${DateFormat('EEEE MMM d, yyyy h:mm a').format(note.lastModifiedDate)}',
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
              ),
            )
            .toList(),
      ),
    );
  }
}
