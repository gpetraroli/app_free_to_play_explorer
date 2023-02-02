import 'package:flutter/material.dart';

import '../widgets/games_list/games_list.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free-to-Game titles'),
      ),
      body: GamesList(),
    );
  }
}
