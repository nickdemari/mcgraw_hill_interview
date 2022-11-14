import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/star_wars_person.dart';
import '../domain/star_wars_people_viewmodel.dart';

class StarWarsPeopleScreen extends StatelessWidget {
  const StarWarsPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars People'),
      ),
      body: Consumer<StarWarsPeopleViewModel>(
        builder: (context, starWarsPeopleViewModel, child) {
          return ListView.builder(
            itemCount: starWarsPeopleViewModel.people.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(starWarsPeopleViewModel.people[index].name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StarWarsPersonDetailScreen(
                        starWarsPerson: starWarsPeopleViewModel.people[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<StarWarsPeopleViewModel>(context, listen: false).getPeople();
        },
        tooltip: 'Load People',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

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
