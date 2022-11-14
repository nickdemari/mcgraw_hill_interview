class StarWarsPerson {
  StarWarsPerson({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });
  late final String name;
  late final String height;
  late final String mass;
  late final String hairColor;
  late final String skinColor;
  late final String eyeColor;
  late final String birthYear;
  late final String gender;
  late final String homeworld;
  late final List<String> films;
  late final List<String> vehicles;
  late final List<String> starships;
  late final String created;
  late final String edited;
  late final String url;

  StarWarsPerson.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    films = List.castFrom<dynamic, String>(json['films']);
    vehicles = List.castFrom<dynamic, String>(json['vehicles']);
    starships = List.castFrom<dynamic, String>(json['starships']);
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['height'] = height;
    data['mass'] = mass;
    data['hair_color'] = hairColor;
    data['skin_color'] = skinColor;
    data['eye_color'] = eyeColor;
    data['birth_year'] = birthYear;
    data['gender'] = gender;
    data['homeworld'] = homeworld;
    data['films'] = films;
    data['vehicles'] = vehicles;
    data['starships'] = starships;
    data['created'] = created;
    data['edited'] = edited;
    data['url'] = url;
    return data;
  }
}
