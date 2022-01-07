import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        ListTile(
          onTap: (){
            Get.to(() => PersonView(person));
          },
            trailing: Icon(Icons.chevron_right),
            title:Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${person.name}",style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                  Text("${person.species} from ${person.planet?.name}"),
                ],
              ),
            )
        ),
        Divider()
      ],
    );
  }


}