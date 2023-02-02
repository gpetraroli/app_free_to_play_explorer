import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game_model.dart';

class GameDetailScreen extends StatelessWidget {
  static const routeName = '/game_detail';

  @override
  Widget build(BuildContext context) {
    final gameId = ModalRoute
        .of(context)
        ?.settings
        .arguments as int;
    final gameData = Provider.of<GameModel>(context);

    gameData.fetchData(gameId);

    return Scaffold(
      appBar: AppBar(
        title: Text(gameData.gameData.toString()),
      ),
      body: Text(gameId.toString()),
    );
  }
}
