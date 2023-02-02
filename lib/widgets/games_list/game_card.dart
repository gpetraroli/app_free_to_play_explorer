import 'package:flutter/material.dart';

import '../../screens/game_detail_screen.dart';

class GameCard extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final String platform;
  final String genre;
  final String description;

  const GameCard({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.platform,
    required this.genre,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(GameDetailScreen.routeName, arguments: id);
      },
      child: Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Row(children: [
              Image.network(
                imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                    ),
                    Text(description),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(genre),
                        Text(platform),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
