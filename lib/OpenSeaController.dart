import 'dart:convert';

import 'package:flutter_application_1/OpenSeaModel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class OpenSeaController extends GetxController{

  var isLoading = false.obs;
  OpenseaModel? openseaModel;

  @override
  Future<void> onInit() async{
    super.onInit();
  
    fetchData();
  }


  fetchData() async{
    try{

        isLoading(true);
        http.Response response = await http.get(Uri.tryParse("https://api.opensea.io/api/v1/assets?collection=cryptopunks")!);
        if(response.statusCode == 200){
          var result = jsonDecode(response.body);

          openseaModel = OpenseaModel.fromJson(result);
        }else {
          print("Error while fetching data");
        }

    }catch(e){

    }finally {
    isLoading(false);
  }
  } 
  
}