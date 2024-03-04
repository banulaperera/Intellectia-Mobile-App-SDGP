import 'dart:convert';

import 'package:client/models/note_dto.dart';
import 'package:client/util/db_util.dart';
import 'package:client/util/local_storage.dart';
import 'package:client/util/refresh_token.dart';
import 'package:client/util/show_Alert.dart';
import 'package:http/http.dart' as http;

class NoteRepository {
  LocalStorage localStorage = LocalStorage();

  Future<List<NoteDTO>?> getAllNotes() async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();
    final res = await http.get(Uri.parse('$baseUrl/note/all'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        });

    if (res.statusCode == 200) {
      final resData = jsonDecode(res.body);
      List<NoteDTO> notes = [
        ...resData['notes'].map((note) => NoteDTO.fromJson(note))
      ];
      if(notes.isNotEmpty) return notes;
    }
    return null;
  }

  Future<bool> addNote(NoteDTO note) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.post(Uri.parse('$baseUrl/note/add'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body: jsonEncode(note.toJsonWithOutID()));

    Map<String, dynamic> resData = jsonDecode(res.body);

    if (res.statusCode == 200) {
      showSuccess(resData['Message']);
      return true;
    } else {
      showSuccess(resData['Message']);
      return false;
    }
  }

  Future<bool> updateNote(NoteDTO note) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.put(Uri.parse('$baseUrl/note/update'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "bearer $accessToken"
        },
        body: jsonEncode(note.toJsonWithID()));

    Map<String, dynamic> resData = jsonDecode(res.body);

    if (res.statusCode == 200) {
      showSuccess(resData['Message']);
      return true;
    } else {
      showSuccess(resData['Message']);
      return false;
    }
  }

  Future<bool> deleteNote(String noteID) async {
    await refreshToken(await localStorage.getAccessToken());
    String accessToken = await localStorage.getAccessToken();

    final res = await http.delete(
      Uri.parse('$baseUrl/note/delete/$noteID'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        "Authorization": "bearer $accessToken"
      },
    );
    Map<String, dynamic> resData = jsonDecode(res.body);
    if(res.statusCode==200){
      showSuccess(resData['Message']);
      return true;
    }else{
      showSuccess(resData['Message']);
      return false;
    }

  }
}
