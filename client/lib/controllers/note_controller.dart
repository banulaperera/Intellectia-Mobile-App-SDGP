import 'package:get/get.dart';

import '../models/note.dart';
import '../models/tile_model.dart';
import '../repository/note_repository.dart';

class NoteController extends GetxController {
  List<TileModel> _filteredNotes = List.empty(growable: true);
  List<TileModel> get filteredNotes => _filteredNotes;

  final List<TileModel> _tileList = List.empty(growable: true);
  List<TileModel> get titleList => _tileList;

  List<Note> _allNotes = List.empty(growable: true);
  List<Note> get allNotes => _allNotes;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    _allNotes = await NoteRepository().getAllNotes() ?? [];
    Set<String> uniqueModuleNames = <String>{};
    for (final note in allNotes) {
      uniqueModuleNames.add(note.moduleName);
      _filteredNotes.clear();
      _tileList.clear();
      for (final moduleName in uniqueModuleNames) {
        List<Note> moduleNotes =
            allNotes.where((note) => note.moduleName == moduleName).toList();
        _tileList.add(TileModel(title: moduleName, tiles: moduleNotes));
      }
      _filteredNotes = _tileList;
      update();
    }
  }

  void search(String text) {
    _filteredNotes = _tileList
        .where((tile) =>
            tile.title.toLowerCase().contains(text.toLowerCase()) ||
            tile.tiles.any((note) =>
                note.content.toLowerCase().contains(text.toLowerCase()) ||
                note.title.toLowerCase().contains(text.toLowerCase())))
        .map((tile) {
      if (tile.title.toLowerCase().contains(text.toLowerCase())) {
        return TileModel(
          title: tile.title,
          tiles: tile.tiles,
        );
      } else {
        return TileModel(
          title: tile.title,
          tiles: tile.tiles
              .where((note) =>
                  note.content.toLowerCase().contains(text.toLowerCase()) ||
                  note.title.toLowerCase().contains(text.toLowerCase()))
              .toList(),
        );
      }
    }).toList();
    update();
  }

  void addNote(String moduleName, String title, String content) async {
    _filteredNotes.add(TileModel(
      title: moduleName,
      tiles: [
        Note(
            moduleName: moduleName,
            createdDate: DateTime.now(),
            lastModifiedDate: DateTime.now(),
            title: title,
            content: content)
      ],
    ));
    await NoteRepository().addNote(
      Note(
          moduleName: moduleName,
          createdDate: DateTime.now(),
          lastModifiedDate: DateTime.now(),
          title: title,
          content: content),
    );
    await fetchNotes();
    update();
  }

  void deleteNoteById(String id) async {
    for (var tile in _filteredNotes) {
      tile.tiles.removeWhere((note) => note.id == id);
    }
    await NoteRepository().deleteNote(id);
    await fetchNotes();
    update();
  }

  void updateNote(String id, DateTime createdDate, String moduleName,
      String title, String content) {
    for (var tile in _filteredNotes) {
      for (var note in tile.tiles) {
        if (note.id == id) {
          note.moduleName = moduleName;
          note.title = title;
          note.content = content;
          note.lastModifiedDate = DateTime.now();
        }
      }
    }
    NoteRepository().updateNote(
      Note(
          id: id,
          moduleName: moduleName,
          createdDate: createdDate,
          lastModifiedDate: DateTime.now(),
          title: title,
          content: content),
    );
    update();
  }
}
