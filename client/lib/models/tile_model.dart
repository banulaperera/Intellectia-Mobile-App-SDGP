import 'package:client/models/note.dart';

class TileModel {
  final String title;
  final List<Note> tiles;

  TileModel({
    required this.title,
    this.tiles = const [],
  });
}
