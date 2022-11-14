// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mcgraw_hill_interview/core/locator.dart';
import 'package:mcgraw_hill_interview/features/star_wars_people/domain/star_wars_people_viewmodel.dart';

import 'package:mcgraw_hill_interview/main.dart';
import 'package:provider/provider.dart';

void main() {
  group('StarWarsPeopleViewModel', () {
    initLocator();
    test('people list should be 10', () async {
      final viewModel = StarWarsPeopleViewModel();
      await viewModel.getPeople();
      expect(viewModel.people.length, 10);
    });
    test('first item should be Luke Skywalker', () async {
      final viewModel = StarWarsPeopleViewModel();
      await viewModel.getPeople();
      expect(viewModel.people.first.name, 'Luke Skywalker');
    });
  });

  group('StarWarsPeopleScreen', () {
    initLocator();
    testWidgets('title should read "Star Wars People"', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => StarWarsPeopleViewModel()),
          ],
          child: const MyApp(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Star Wars People'), findsOneWidget);
    });
  });
}
