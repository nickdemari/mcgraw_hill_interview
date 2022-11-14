import 'package:flutter/material.dart';
import 'package:mcgraw_hill_interview/core/locator.dart';
import 'package:mcgraw_hill_interview/features/star_wars_people/domain/star_wars_people_viewmodel.dart';
import 'package:provider/provider.dart';

import 'features/star_wars_people/presentation/star_wars_people.dart';

void main() {
  initLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StarWarsPeopleViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'McGraw Hill Interview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StarWarsPeopleScreen(),
    );
  }
}
