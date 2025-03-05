import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testaaaa/controller/ApicallingController.dart';

class Productdeatails extends StatelessWidget {
  const Productdeatails({super.key});

  @override
  Widget build(BuildContext context) {
    Apicallingcontroller controller = Get.find();
    return Scaffold(
      appBar: AppBar( title: const Text("Procut Deatails"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( color: Colors.black,borderRadius: BorderRadius.circular(20)),
                child:       Text('${controller.productData[controller.selectedIndex.value]['category']}',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
            50.verticalSpace,
            Text('Title: ${controller.productData[controller.selectedIndex.value]['title']}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            Text('Descrption: ${controller.productData[controller.selectedIndex.value]['description']}', maxLines: 2,style: TextStyle(color: Colors.red ),),

            Text('Rate: ${controller.productData[controller.selectedIndex.value]['rating']['rate']}'),
            Text('Price: ${controller.productData[controller.selectedIndex.value]['rating']['count']}'),
          Center(child: Image.network('${controller.productData[controller.selectedIndex.value]['image']}',height: 300.h,width: 300.w,))
        ],
      ),
    );
  }
}
