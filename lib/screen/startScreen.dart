import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testaaaa/screen/apiCallingTask.dart';
import 'package:testaaaa/screen/task2.dart';

class startScreen extends StatelessWidget {
  const startScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
                Center(child: ElevatedButton(onPressed: (){
                  Get.to(() => const Apicallingtask());
                }, child: const Text("TASK 1"))),
                ElevatedButton(onPressed: (){
                  Get.to(() => Task2());
                }, child: const Text("Task 2")),
             ],
           ),
      ),
    );
  }
}
