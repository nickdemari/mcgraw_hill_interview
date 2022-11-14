import 'package:oxidized/oxidized.dart';

import '../models/people_result.dart';
import '../models/star_wars_person.dart';
import '../services/api/api_service.dart';

class PeopleRepository {
  final _apiService = ApiService.instance;

  Future<Result<PeopleResult, dynamic>> getPeople() async {
    final response = await _apiService.get('/api/people');

    if (response.isErr()) {
      return Result.err(response.unwrapErr());
    }

    return Result.ok(PeopleResult.fromJson(response.unwrap()));
  }

  Future<Result<StarWarsPerson, dynamic>> getPerson(String id) async {
    final response = await _apiService.get('/people/$id');

    if (response.isErr()) {
      return Result.err(response.unwrapErr());
    }

    return Result.ok(StarWarsPerson.fromJson(response.unwrap()));
  }
}
