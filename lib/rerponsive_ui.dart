import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_demo/home_page.dart';
import 'package:getx_demo/responsive_controller.dart';

class Responsive extends StatefulWidget {

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  final TextEditingController controller=TextEditingController();
  String message = "";
  String message2="";
  late int randomNum;
  void initState(){
    super.initState();
    randomNum=RandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Responsive Ui"),
          backgroundColor: Colors.blue
          ,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListTile(
              title: Text("Counter App"),
              trailing: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home_page(),));

              }, icon: Icon(Icons.navigate_next)),
            ),
          ),

        ),
        body: Scaffold(
          body: Center(
            child: Container(
              height: 280.h,
              width: 320.w,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.3),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  Container(
                    height: 50.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                    ),
                    child: Center(
                      child: Text("Guess the number game",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      height: 50.h,
                      width: 250.w,
                      child: TextField(
                        controller: controller,

                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            label: Text("Enter Number:1-100",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                        onPressed: (){
                          int ? userInput=int.tryParse(controller.text);
                          if(userInput != null && userInput >= 1 && userInput <= 100){

                            if(userInput==randomNum){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("Correct"),
                                  content: Text("You gussed the right number"),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        randomNum=RandomNumber();
                                        controller.clear();
                                        message="";
                                        message2="";
                                      });
                                    }, child: Text("Ok"))
                                  ],
                                );


                              });
                            }else if(userInput>randomNum){
                              setState(() {
                                message="Your guess is high";
                                message2="Try lower number";
                              });

                            }else if(userInput<randomNum){
                              setState(() {
                                message="Your guess is low";
                                message2="Try higher number";
                              });

                            }


                          }


                        }, child: Text("Submit",
                      style: TextStyle(fontSize: 15.sp),
                    )),
                  ),

                  if(message.isNotEmpty)
                    Text(message,
                    style: TextStyle(color: Colors.red,
                    fontSize: 15.sp
                    ),
                    ),
                  if(message2.isNotEmpty)
                    Text(message2,
                      style: TextStyle(color: Colors.green,
                          fontSize: 20.sp
                      ),
                    )
                ],
              ),
            ),
          ),


        )
    );
  }
}
int RandomNumber() {
  int number;
  Random num =new Random();
  number=num.nextInt(100);



  return number;

}
