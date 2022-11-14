import 'star_wars_person.dart';

class PeopleResult {
  PeopleResult({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });
  late final int count;
  late final String next;
  late final Null previous;
  late final List<StarWarsPerson> results;

  PeopleResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = null;
    results = List.from(json['results']).map((e) => StarWarsPerson.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}
