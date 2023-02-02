import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/games_model.dart';
import './game_card.dart';

class GamesList extends StatelessWidget {
  const GamesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gamesData = Provider.of<GamesModel>(context);

    return gamesData.isApiDown
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Column(
                  children: [
                    Text('Api is down!'),
                    ElevatedButton(
                      onPressed: gamesData.fetchGames,
                      child: Text('Retry'),
                    )
                  ],
                ),
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: ((context, index) => GameCard(
                  id: gamesData.games[index]['id'],
                  title: gamesData.games[index]['title'],
                  imageUrl: gamesData.games[index]['thumbnail'],
                  platform: gamesData.games[index]['platform'],
                  genre: gamesData.games[index]['genre'],
                  description: gamesData.games[index]['short_description'],
                )),
            itemCount: gamesData.count,
          );
  }
}
