import 'package:flutter/foundation.dart';

import '../../../core/models/star_wars_person.dart';
import '../../../core/repositories/people_repository.dart';

class StarWarsPeopleViewModel extends ChangeNotifier {
  final _peopleRepository = PeopleRepository();

  final people = <StarWarsPerson>[];

  Future<void> getPeople() async {
    final result = await _peopleRepository.getPeople();
    if (result.isOk()) {
      people.addAll(result.unwrap().results);
      notifyListeners();
    } else {
      throw result.unwrapErr();
    }
  }
}
