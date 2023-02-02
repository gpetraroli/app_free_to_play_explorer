import 'package:app_free_to_play_explorer/models/game_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/games_screen.dart';
import './screens/game_detail_screen.dart';

import './models/games_model.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GamesModel gamesModel = GamesModel();
    gamesModel.fetchGames();

    GameModel gameModel = GameModel();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: gamesModel),
        ChangeNotifierProvider.value(value: gameModel),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.brown,
          ),
        ),
        home: GamesScreen(),
        routes: {
          GameDetailScreen.routeName: (ctx) => GameDetailScreen(),
        },
      ),
    );
  }
}
