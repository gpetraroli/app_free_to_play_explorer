import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game_model.dart';

class GameDetailScreen extends StatelessWidget {
  static const routeName = '/game_detail';

  @override
  Widget build(BuildContext context) {
    final gameId = ModalRoute.of(context)?.settings.arguments as int;
    final gameModel = Provider.of<GameModel>(context);

    final gameData = gameModel.fetchGame(gameId);

    print(gameData);

    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Text(gameId.toString()),
    );
  }
}
