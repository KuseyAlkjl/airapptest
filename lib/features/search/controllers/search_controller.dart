import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../util/app_assets.dart';
import '../models/destination_model.dart';
import '../models/search_model.dart';

class MySearchController extends GetxController {
  @override
  void onInit() {
    loadJsonData();
    super.onInit();
  }

  TextEditingController takeOffTextController = TextEditingController();
  TextEditingController landingTextController = TextEditingController();

  final takeoffFocus = FocusNode();
  final landingFocus = FocusNode();

  String? selectedTakeOffCode;
  String? selectedLandingCode;

  SearchModel? searchModel;
  DestinationModel? destinationModel;

  List<Legs> filteredLegs = [];

  bool isLoading = false;
  bool isSearched = false;

  Future<void> loadJsonData() async {
    isLoading = true;
    update();

    try {
      String searchJson = await rootBundle.loadString(AppAssets.searchJson);
      String destinationJson = await rootBundle.loadString(AppAssets.destinationJson);

      searchModel = SearchModel.fromJson(jsonDecode(searchJson));
      destinationModel = DestinationModel.fromJson(jsonDecode(destinationJson));

      if (searchModel != null && destinationModel != null) {
        isLoading = false;
        update();
      }
    } catch (e) {
      print("Error loading JSON data: $e");
      isLoading = false;
      update();
    }
  }

  List<Ports> getFilteredPorts(String query) {
    if (destinationModel == null || destinationModel!.ports == null) return [];

    return destinationModel!.ports!.where((port) {
      return port.code!.toLowerCase().contains(query.toLowerCase()) ||
          port.explanation!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void saveSelectedTakeOffPort(Ports port) {
    selectedTakeOffCode = port.code;
    takeOffTextController.text = port.explanation ?? '';

  }

  void saveSelectedLandingPort(Ports port) {
    selectedLandingCode = port.code;
    landingTextController.text = port.explanation ?? '';
  }

  void updateFilteredLegs() {
    if (searchModel != null && selectedTakeOffCode != null && selectedLandingCode != null) {
      filteredLegs = filterLegs(searchModel!.departureLegs!, selectedTakeOffCode!, selectedLandingCode!);
    }
    isSearched=true;
    update();
  }

  List<Legs> filterLegs(List<Legs> legs, String selectedTakeOffCode, String selectedLandingCode) {
    return legs.where((leg) => leg.depPort == selectedTakeOffCode && leg.arrPort == selectedLandingCode).toList();
  }
}