import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testaaaa/screen/startScreen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(1242, 2280),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
         home: startScreen(),
      ),
    );
  }
}
