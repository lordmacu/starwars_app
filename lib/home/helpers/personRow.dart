import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:starwars_app/home/controllers/HomeContoller.dart';
import 'package:starwars_app/person/personView.dart';
import '../../person/controllers/PersonController.dart';
import 'package:starwars_app/home/model/Person.dart';

class PersonRow extends StatelessWidget{

  PersonContoller controllerPerson= Get.find();
  Person person;
  PersonRow(this.person);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
         margin: EdgeInsets.all(20),

         child:  ListTile(
             onTap: () async{

               var sounds=["assets/blast.mp3","assets/laser.mp3","assets/blast.mp3"];
               final _random = new Random();
               var element = sounds[_random.nextInt(sounds.length)];

               final player = AudioPlayer();
               var duration = await player.setAsset(element);
               player.play();
               Get.to(() => PersonView(person));
             },

             title:Container(
               padding: EdgeInsets.only(top: 10,bottom: 10),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("${person.name}",style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.yellowAccent),),
                   Text("${person.species} from ${person.planet?.name}",style: TextStyle(color: Colors.yellowAccent),),
                 ],
               ),
             )
         ),
       ),

      ],
    );
  }


}