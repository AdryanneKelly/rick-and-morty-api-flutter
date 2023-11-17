import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/models/episode_model.dart';

class ApiProvider with ChangeNotifier {
  final url = 'rickandmortyapi.com';
  List<Character> characters = [];
  List<EpisodeModel> episodes = [];

  Future<void> getCharacters(int page) async {
    final result = await http.get(Uri.https(url, '/api/character', {
      'page': page.toString(),
    }));
    final response = characterModelFromJson(result.body);
    characters.addAll(response.results!);
    notifyListeners();
  }

  Future<List<Character>> getCharacter(String name) async {
    final result = await http.get(Uri.https(url, '/api/character', {
      'name': name,
    }));
    final response = characterModelFromJson(result.body);
    return response.results!;
  }

  Future<List<EpisodeModel>> getEpisodes(Character character) async {
    episodes = [];
    for (var i = 0; i < character.episode!.length; i++) {
      final result = await http.get(Uri.parse(character.episode![i]));
      final response = episodeModelFromJson(result.body);
      episodes.add(response);
      notifyListeners();
    }
    return episodes;
  }
}
