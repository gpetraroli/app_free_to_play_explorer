import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GameModel with ChangeNotifier {
  var _gameData = {
    'id': 0,
    'title': '',
  };

  fetchGame(int id) async {
    var response =
        await http.get(Uri.parse('https://www.freetogame.com/api/game?id=$id'));

    final data = jsonDecode(response.body);
    _gameData['id'] = data['id'];
    _gameData['title'] = data['title'];
    print(data);
    // notifyListeners();
  }

  get gameData {
    return _gameData;
  }
}
