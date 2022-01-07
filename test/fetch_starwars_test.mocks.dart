import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchPeople(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://swapi.dev/api/people'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.toString());
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load people');
  }
}

Future fetchVehicles(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://swapi.dev/api/vehicles/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.toString());
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load vehicle');
  }
}

Future fetchPlanets(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://swapi.dev/api/planets/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.toString());
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load planet');
  }
}

Future fetchSpecies(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://swapi.dev/api/species/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.toString());
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load species');
  }
}