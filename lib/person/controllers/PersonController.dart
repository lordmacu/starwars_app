import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:starwars_app/api_client.dart';
import 'package:starwars_app/home/home_provider.dart';
import 'package:starwars_app/home/model/Person.dart';
import 'package:starwars_app/home/model/Specie.dart';
import 'package:starwars_app/home/model/Vehicle.dart';

class PersonContoller extends GetxController {
  var scrollController = new ScrollController().obs;

  Client _client = new Client();
  var _endpointProvider;
  var person =Person().obs;

  @override
  void onInit() async {
    _endpointProvider = new HomeProvider(_client.init());

  }



}
