import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ml_card_scanner/ml_card_scanner.dart';
import 'package:path_provider/path_provider.dart';

import '../../leg_details/models/leg_details_model.dart';

class PaymentResultController extends GetxController {
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


  String downloadProgress = "0%";
  bool isDownloading = false;
  late String downloadPath;

  Future<void> downloadPdf() async {
    isDownloading = true;
    downloadProgress = "0%";
    update();

    try {
      final dir = await getApplicationDocumentsDirectory();
      downloadPath = "${dir.path}/ecloud.pdf";

      // Using direct link for the PDF
      const pdfUrl = 'https://drive.google.com/uc?export=download&id=1VUI8VePiGzWbk7bi_Lr4O3SvIB8Pn92c';

      await Dio().download(pdfUrl, downloadPath, onReceiveProgress: (received, total) {
        if (total != -1) {
          downloadProgress = "${(received / total * 100).toStringAsFixed(0)}%";
          update();
        }
      });
      Get.snackbar(
        'Bilit',
        'Bilit indirilmiş',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withOpacity(0.8),
        colorText: Colors.deepPurple,
        duration: Duration(seconds: 3),
      );
      isDownloading = false;
      update();
    } catch (e) {
      isDownloading = false;
      downloadProgress = "Failed to download";
      update();
      print("Download error: $e");
    }
  }


}