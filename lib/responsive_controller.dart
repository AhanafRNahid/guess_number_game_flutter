import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_demo/responsive_controller.dart';

class Responsive extends StatefulWidget {

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  final TextEditingController controller=TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Responsive Ui"),
          backgroundColor: Colors.blue
          ,
        ),
        body: Scaffold(
          body: Center(
            child: Container(
              height: 300.h,
              width: 300.w,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.3),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                    ),
                    child: Center(
                      child: Text("This is a Responsive Ui",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 30.h,
                      width: 150.w,
                      child: TextField(
                        controller: controller,

                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            label: Text("Enter Number:1-100",
                              style: TextStyle(fontSize: 10.sp),
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
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5)
                        ),
                        onPressed: (){
                          int ? userInput=int.tryParse(controller.text);
                          if(userInput != null && userInput >= 1 && userInput <= 100){
                            int randomNum = RandomNumber();
                            if(userInput==randomNum){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("Correct"),
                                  content: Text("Ypu guesd the right number"),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                      setState(() {
                                        randomNum=RandomNumber();
                                      });
                                    }, child: Text("Ok"))
                                  ],
                                );


                              });
                            }else if(userInput>randomNum){
                              setState(() {
                                message="Your guess is high";
                              });

                            }else if(userInput<randomNum){
                              setState(() {
                                message="Your guess is low";
                              });

                            }


                          }


                        }, child: Text("Submit",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(.1),
                          borderRadius: BorderRadius.circular(11)
                      ),

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
