import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:starwars_app/api_client.dart';
import 'package:starwars_app/home/home_provider.dart';
import 'package:starwars_app/home/model/Person.dart';
import 'package:starwars_app/home/model/Planet.dart';
import 'package:starwars_app/home/model/Specie.dart';
import 'package:starwars_app/home/model/Vehicle.dart';

class HomeContoller extends GetxController {
  var scrollController = new ScrollController().obs;

  Client _client = new Client();
  var _endpointProvider;
  var isError = false.obs;
  var page = 1.obs;
  var people = [].obs;

  var isLoading=true.obs;

  @override
  void onInit() async {
    _endpointProvider = new HomeProvider(_client.init());

    _scrollListener() {
      if (scrollController.value.offset >=
              scrollController.value.position.maxScrollExtent &&
          !scrollController.value.position.outOfRange) {
        loadMore();
      }
    }

    scrollController.value.addListener(_scrollListener);
    playLocal();

    getPeople();


  }

  Future playLocal() async {
   // int result = await audioPlayer.value.play(url);
    final player = AudioPlayer();
    await player.setLoopMode(LoopMode.all); // loop playlist

    var duration = await player.setAsset('assets/starwars.mp3');
    player.play();
  }

  loadMore() async {
    page = page + 1;

    getPeople();
  }

  getPeople() async {

    //try{
    isLoading.value=true;
    var data = await _endpointProvider.getPeople(page.value);


    var results = data["results"];

    for (var p in results) {


      Person person = Person();
      person.name = p["name"];
      person.birth_year = p["birth_year"];
      person.gender = p["gender"];
      person.hair_color = p["hair_color"];
      person.eye_color = p["eye_color"];
      person.height = p["height"];
      person.homeworld = p["homeworld"];
      person.mass = p["mass"];
      person.skin_color = p["skin_color"];

      var vehicles = p["vehicles"];
      
      List<Vehicle> vehiclesArray=[];
      for (var v in vehicles) {
        List<String> vehicleId = v.split("/");

        var vehicleEndPoint =
        await _endpointProvider.getVehicles(vehicleId[vehicleId.length - 2]);

        vehiclesArray.add(Vehicle(name: vehicleEndPoint["name"], url: v));

      }
      person.vehicles=vehiclesArray;



      var species = p["species"];

      List<String> speciesArray=[];
      if(species.length>0){
        for (var s in species) {
          List<String> specieId = s.split("/");
          var specieEndpoint =
          await _endpointProvider.getSpecie(specieId[specieId.length - 2]);
          speciesArray.add(specieEndpoint["name"]);
        }
        person.species= speciesArray.join(",");
      }else{
        person.species="Human";
      }

      var homeWorld=p["homeworld"];
      List<String> urlHomeWorld = homeWorld.split("/");


      var planetEndpoint =
      await _endpointProvider.getHomeWorld(urlHomeWorld[urlHomeWorld.length - 2]);

      Planet planet = Planet();

      planet.name=planetEndpoint["name"];
      planet.rotation_period=planetEndpoint["rotation_period"];
      planet.orbital_period=planetEndpoint["orbital_period"];
      planet.diameter=planetEndpoint["diameter"];
      planet.climate=planetEndpoint["climate"];
      planet.gravity=planetEndpoint["gravity"];
      planet.terrain=planetEndpoint["terrain"];
      planet.surface_water=planetEndpoint["surface_water"];
      planet.population=planetEndpoint["population"];

      person.planet=planet;

      people.add(person);

    }
    isLoading.value=false;

    //}catch(e){
    // isError.value=true;
    //}
  }
}
