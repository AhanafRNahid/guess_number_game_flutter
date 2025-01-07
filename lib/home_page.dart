
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/home_age_Controller.dart';
import 'package:getx_demo/rerponsive_ui.dart';

class Home_page extends StatelessWidget{
  Home_controiller contoller= Home_controiller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX demo"),
        backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Obx((){
          return Text(contoller.i.toString(),
          style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),
          );
        })
      ),
      
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            contoller.increment();

          }),

    );
  }
  
  
}