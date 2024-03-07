import 'package:client/models/note_dto.dart';

class TileModel {
  final String title;
  final List<NoteDTO> tiles;

  TileModel({
    required this.title,
    this.tiles = const [],
  });
}
