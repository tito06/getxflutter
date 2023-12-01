import 'package:flutter/material.dart';
import 'package:flutter_application_1/OpenSeaController.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {

  OpenSeaController openSeaController = Get.put(OpenSeaController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Open Api'),),
      body: Obx(() => 
      openSeaController.isLoading.value ? Center(
        child: CircularProgressIndicator(),
      ): ListView.builder(
        itemCount: openSeaController.openseaModel?.assets?.length ?? 0,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(openSeaController.openseaModel?.assets![index].name ?? 'no name'),
          );
        })),
    );
  }
}

