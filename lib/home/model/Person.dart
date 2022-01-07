import 'package:starwars_app/home/model/Film.dart';
import 'package:starwars_app/home/model/Planet.dart';
import 'package:starwars_app/home/model/Specie.dart';
import 'package:starwars_app/home/model/Vehicle.dart';

class Person{
  String? name;
  String? birth_year;
  String? created;
  String? edited;
  String? eye_color;
  String? gender;
  String? hair_color;
  String? height;
  String? homeworld;
  String? mass;
  String? skin_color;
  String? url;
  List<Film>? films=[];
  List<Vehicle>? vehicles=[];
  String? species;
  List<Vehicle>? starships=[];
  Planet? planet;

  Person({
    this.name,
    this.birth_year,
    this.created,
    this.edited,
    this.eye_color,
    this.gender,
    this.hair_color,
    this.height,
    this.homeworld,
    this.mass,
    this.skin_color,
    this.url,
     this.films,
     this.vehicles,
    this.species,
     this.starships,
    this.planet,

  });

  @override
  String toString() {
    return 'Person{name: $name, birth_year: $birth_year, created: $created, edited: $edited, eye_color: $eye_color, gender: $gender, hair_color: $hair_color, height: $height, homeworld: $homeworld, mass: $mass, skin_color: $skin_color, url: $url, films: $films, vehicles: $vehicles, species: $species, starships: $starships, planet: $planet}';
  }
}