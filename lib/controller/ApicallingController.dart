import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:testaaaa/Utils/Utils.dart';
class Apicallingcontroller extends GetxController{

  var productData ;
  RxInt selectedIndex = 0.obs;
 RxBool gridview = true.obs;
  @override
  void onInit() {

    super.onInit();
    // apiCalling();
  }

  Future<void>apiCalling()async{
  try{
    var request = http.Request('GET', Uri.parse('https://fakestoreapi.com/products?limit=10'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var josnString = await response.stream.bytesToString();
      var jsonDecode = json.decode(josnString);
      productData = jsonDecode;
      print(productData);

    // Utils.toast("API calling susufullly");
    }
    else {
      // Utils.toast("error to featch data");
      print(response.reasonPhrase);
    }
  }catch(e){
    // Utils.toast("error");
    print(e);
  }

  }

}