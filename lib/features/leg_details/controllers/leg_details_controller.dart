import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../util/app_assets.dart';
import '../models/leg_details_model.dart';

class LegDetailsController extends GetxController {
  var legId;
  @override
  void onInit() {
    if(Get.arguments!=null){
      legId=Get.arguments['legId'];
      print(legId);
    }
    loadJsonData();
    super.onInit();
  }
  SearchModel? searchModel;

  Legs legDetails = Legs();

  bool isLoading = false;

  Future<void> loadJsonData() async {
    isLoading = true;
    update();

    try {
      String searchJson = await rootBundle.loadString(AppAssets.searchJson);

      searchModel = SearchModel.fromJson(jsonDecode(searchJson));

      if (searchModel != null &&legId!=null ) {
        getDetails();
        isLoading = false;
        update();
      }
    } catch (e) {
      print("Error loading JSON data: $e");
      isLoading = false;
      update();
    }
  }

  void getDetails(){
    for(int i=0;i<searchModel!.departureLegs!.length;i++){
      if(legId==searchModel!.departureLegs![i].legId){
        legDetails=searchModel!.departureLegs![i];
        print(legDetails.airline);
        return;
      }
    }
    for(int i=0;i<searchModel!.returnLegs!.length;i++){
      if(legId==searchModel!.returnLegs![i].legId){
        legDetails=searchModel!.returnLegs![i];
        return;
      }
    }
  }

}