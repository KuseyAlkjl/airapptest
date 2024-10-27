
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../leg_details/models/leg_details_model.dart';

class SeatController extends GetxController {

  Legs legDetails = Legs();
  @override
  void onInit() {
    if(Get.arguments!=null){
      legDetails=Get.arguments['legDetails'];

    }
    super.onInit();
  }
  Map<String, String> seats = {
    'A1': 'available',
    'A2': 'available',
    'A3': 'available',
    'A4': 'available',
    'B1': 'available',
    'B2': 'available',
    'B3': 'available',
    'B4': 'available',
    'C1': 'booked',
    'C2': 'available',
    'C3': 'available',
    'C4': 'available',
    'D1': 'available',
    'D2': 'available',
    'D3': 'available',
    'D4': 'booked',
  };

  String? selectedSeat;

  void selectSeat(String seat) {
    print(seats);
    if (seats[seat] == 'available') {
      selectedSeat = (selectedSeat == seat) ? null : seat;
      print("Selected seat: $selectedSeat");
      update();
    } else {
      print("Seat $seat is either booked or does not exist.");
    }
  }

  Color getSeatColor(String seat) {
    if (seats[seat] == 'booked') {
      return Colors.grey.shade300;
    } else if (selectedSeat == seat) {
      return Colors.deepPurple;
    } else {
      return Colors.white;
    }
  }
}