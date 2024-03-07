import 'package:client/models/note_dto.dart';

class BasicTile {
  final String title;
  final List<NoteDTO> tiles;

  BasicTile({
    required this.title,
    this.tiles = const [],
  });
}
