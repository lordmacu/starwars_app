import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_starwars_test.mocks.dart';
class MockClients extends Mock implements http.Client {}

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('FechPeople', () {
    test('returns an People if the http call completes successfully', () async {
      final client = MockClients();

      when(client
          .get(Uri.parse('https://swapi.dev/api/people')));

      expect(await fetchPeople(client), isA<List>());
    });


  });


  group('fetchSpecies', () {
    test('returns an Species if the http call completes successfully', () async {
      final client = MockClients();

      when(client
          .get(Uri.parse('https://swapi.dev/api/species/2')));

      expect(await fetchPeople(client), isA<List>());
    });

  });



  group('fetchPlanets', () {
    test('returns an Planets if the http call completes successfully', () async {
      final client = MockClients();

      when(client
          .get(Uri.parse('https://swapi.dev/api/planets/2')));

      expect(await fetchPeople(client), isA<List>());
    });

  });


  group('FetchVehicles', () {
    test('returns an Vehicles if the http call completes successfully', () async {
      final client = MockClients();

      when(client
          .get(Uri.parse('https://swapi.dev/api/vehicles/2')));

      expect(await fetchPeople(client), isA<List>());
    });

  });



}