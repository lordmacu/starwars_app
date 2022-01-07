import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:starwars_app/home/controllers/HomeContoller.dart';
import 'package:get/get.dart';
import '../person/controllers/PersonController.dart';
import 'package:starwars_app/home/helpers/loadingSpinner.dart';
import 'package:starwars_app/home/helpers/personRow.dart';
import 'package:starwars_app/home/model/Person.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Home extends StatelessWidget{

  HomeContoller controllerHome= Get.put(HomeContoller());
  PersonContoller contollerPerson= Get.put(PersonContoller());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Obx(()=>controllerHome.page==1 ? Text("People of Star Wars") : Text("People")),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            controllerHome.isError.value ? Center(
              child: Container(
                child: Text("Failed to Load Data",style: TextStyle(color: Colors.redAccent),),
              ),
            ): Container(),

            Expanded(child: Obx(()=>ListView.builder(
                controller: controllerHome.scrollController.value,
                itemCount: controllerHome.people.length,

                itemBuilder: (BuildContext context,int index){

                  if(controllerHome.people.length-1 == index){
                    return Column(
                      children: [
                        PersonRow(controllerHome.people[index]),
                        Obx(()=>controllerHome.isLoading.value ? LoadingSpinner(): Container())
                      ],
                    );
                  }else{
                    return PersonRow(controllerHome.people[index]);
                  }

                }
            ))),




          ],
        ),
      ),
    );
  }
  Future<bool> _loadMore() async {
    controllerHome.loadMore();
    return true;
  }

}

