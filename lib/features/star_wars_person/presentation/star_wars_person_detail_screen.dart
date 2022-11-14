import 'package:flutter/material.dart';

import '../../../core/models/star_wars_person.dart';

class StarWarsPersonDetailScreen extends StatelessWidget {
  const StarWarsPersonDetailScreen({super.key, required this.starWarsPerson});
  final StarWarsPerson starWarsPerson;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(starWarsPerson.name),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Birth Year: ${starWarsPerson.birthYear}'),
        ],
      )),
    );
  }
}
