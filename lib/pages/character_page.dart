import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/widgets/card_data_widget.dart';
import 'package:rick_and_morty_app/widgets/episode_list_widget.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(character.name!),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
                width: double.infinity,
                child: Hero(
                  tag: character.id!,
                  child: Image.network(
                    character.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: size.height * 0.14,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardDataWidget(text1: 'Status', text2: character.status!),
                    CardDataWidget(text1: 'Specie', text2: character.species!),
                    CardDataWidget(
                        text1: 'Origin', text2: character.origin!.name!),
                  ],
                ),
              ),
              const Text(
                'Episodes',
                style: TextStyle(fontSize: 17),
              ),
              EpisodeListWidget(size: size, character: character)
            ],
          ),
        ));
  }
}
