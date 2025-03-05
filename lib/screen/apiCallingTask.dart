import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testaaaa/controller/ApicallingController.dart';
import 'package:testaaaa/screen/productDeatails.dart';

class Apicallingtask extends StatefulWidget {
  const Apicallingtask({super.key});

  @override
  State<Apicallingtask> createState() => _ApicallingtaskState();
}

class _ApicallingtaskState extends State<Apicallingtask> {

  Apicallingcontroller controller = Get.put(Apicallingcontroller());
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callapi();
  }

  void callapi()async{
    await controller.apiCalling();
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Api calling "),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
           if(controller.gridview.value == true){
             controller.gridview.value = false;
           }else{
             controller.gridview.value = true;
           }
          }, icon: Icon(  controller.gridview.value == true ? Icons.grid_view: Icons.list_outlined))
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: [
                 Obx(
              ()=> GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: controller.gridview.value == true ? 2: 1,childAspectRatio: 1),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  ( controller.productData != null ) ? controller.productData.length : 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          controller.selectedIndex.value = index;
                          Get.to(() => const Productdeatails());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network('${controller.productData[index]['image']}',height: 250.h,width: 250.h,),
                            30.verticalSpace,
                            Center(child: Container(decoration: const BoxDecoration(color: Colors.white),child: Text("Title: ${controller.productData[index]['title']}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),textAlign: TextAlign.center,maxLines: 1,),)),
                            10.verticalSpace,
                            Center(child: Container(decoration: const BoxDecoration(color: Colors.white),child: Text("Deatails: ${controller.productData[index]['description']}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 8 ),textAlign: TextAlign.center,maxLines: 3,),)),
                            20.verticalSpace,
                            Center(child: Container(decoration: const BoxDecoration(color: Colors.white),child: Text("Price: ${controller.productData[index]['price']}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 8 ),textAlign: TextAlign.center,maxLines: 3,),)),
                          ],
                        ),
                      );
                    },),
                 ),
                if(loading == true)Center(child: CircularProgressIndicator())
              ],
            ),
        ),
      )
    );
  }
}
