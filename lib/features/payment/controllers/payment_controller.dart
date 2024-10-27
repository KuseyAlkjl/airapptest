import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ml_card_scanner/ml_card_scanner.dart';

import '../../leg_details/models/leg_details_model.dart';

class PaymentController extends GetxController {
  CardInfo? cardInfo;

  Legs legDetails = Legs();
  String? seat;
  @override
  void onInit() {
    if(Get.arguments!=null){
      legDetails=Get.arguments['legDetails'];
      seat=Get.arguments['seat'];
    }
    super.onInit();
  }

  TextEditingController cardNumber=TextEditingController();
  TextEditingController expirationDate=TextEditingController();
  TextEditingController cvcNumber=TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void setCardInfo(CardInfo? info) {
    cardInfo = info;
    cardNumber.text=info!.number;
    expirationDate.text=info.expiry;
    update();
  }

  bool isLoading=false;

  void clearCardInfo() {
    cardInfo = null;
    update();
  }

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        expirationDate.text = DateFormat('MM/yy').format(selectedDate!);
    }
  }

}