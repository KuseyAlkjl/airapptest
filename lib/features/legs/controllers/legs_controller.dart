
import 'package:get/get.dart';

import '../../search/models/search_model.dart';

class LegsController extends GetxController {
  @override
  void onInit() {
    if(Get.arguments!=null){
      legsModel=Get.arguments['legs'];
    }
    super.onInit();
  }
  bool isLoading=false;
  List<Legs>? legsModel;

}