import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:starwars_app/home/controllers/HomeContoller.dart';
import 'package:get/get.dart';
import 'package:starwars_app/home/model/Vehicle.dart';
import 'controllers/PersonController.dart';
import 'package:starwars_app/home/helpers/loadingSpinner.dart';
import 'package:starwars_app/home/helpers/personRow.dart';
import 'package:starwars_app/home/model/Person.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PersonView extends StatelessWidget{

  Person person;
  PersonView(this.person);


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title:Text("${person.name}"),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    child: Text("General Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15,top: 15),
                        child: Row(

                          children: [
                            Text("Eye Color",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                            Text("${person.eye_color}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15,top: 15),
                        child: Row(

                          children: [
                            Text("Hair Color",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                            Text("${person.hair_color}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15,top: 15),
                        child: Row(

                          children: [
                            Text("Skin Color",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                            Text("${person.skin_color}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(bottom: 10,top: 10),
                        child: Row(

                          children: [
                            Text("Birth Year",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                            Text("${person.birth_year}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Divider()
                    ],
                  )

                ],
              ),
            )),
            this.person.vehicles!.length>0 ? Expanded(child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    child: Text("Vehicles",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  Expanded(child: ListView.builder(
                      itemCount: person.vehicles?.length,

                      itemBuilder: (BuildContext context,int index){


                        return Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10,top: 10),

                                child: Text("${person.vehicles?[index].name}",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),),
                              ),
                              Divider()
                            ],
                          ),
                        );

                      }
                  ))

                ],
              ),
            )) :Container(),
          ],
        ),
      ),
    );
  }


}

