import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GamesModel with ChangeNotifier {
  List<dynamic> _games = [];
  bool _isApiDown = false;

  GamesModel() {
    fetchGames();
  }

  fetchGames() async {
    try {
      var response =
          await http.get(Uri.parse('https://www.freetogame.com/api/games'));

      _games = jsonDecode(response.body);
    } catch (e) {
      _isApiDown = true;
    } finally {
      notifyListeners();
    }
  }

  List<dynamic> get games {
    return [..._games];
  }

  int get count {
    return _games.length;
  }

  bool get isApiDown {
    return _isApiDown;
  }
}
