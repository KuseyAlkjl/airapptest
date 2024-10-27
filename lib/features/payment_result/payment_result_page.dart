

import 'package:airapp/features/payment/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'controllers/payment_result_controller.dart';

class PaymentResultPage extends StatelessWidget {
  const PaymentResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height*.2,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.deepPurple
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Ödeme sonucu',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height*.15,
              child: Container(
                width: Get.width,
                height: Get.height*.75,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                child: GetBuilder<PaymentResultController>(
                  init: PaymentResultController(),
                  builder: (c) {
                    return ListView(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 30,),
                        Card(
                          color: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      c.legDetails.airline.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                          fontSize: 20
                                      ),
                                    ),
                                    const Column(
                                      children: [
                                        Text(
                                          'Air-Tran Airlines',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16
                                          ),
                                        ),
                                        Text(
                                          'Business',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 13
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.legDetails.depPort.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),
                                        Text(
                                          c.legDetails.depTime.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black45,
                                              fontSize: 13
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          child: Divider(
                                            height: 2,
                                            thickness: 2,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Icon(
                                            Icons.flight,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                          child: Divider(
                                            height: 2,
                                            thickness: 2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.legDetails.arrPort.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),
                                        Text(
                                          c.legDetails.arrTime.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black45,
                                              fontSize: 13
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          'Kusey',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),

                                      ],
                                    ),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'class',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          'Business',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          c.legDetails.flightDate.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Terminal',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),

                                      ],
                                    ),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Gate',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Flight',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 15
                                          ),
                                        ),
                                        Text(
                                          c.legDetails.flightNo.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 18
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 40,),
                                QrImageView(
                                  data: 'https://drive.google.com/file/d/1VUI8VePiGzWbk7bi_Lr4O3SvIB8Pn92c/view?usp=sharing',
                                  version: QrVersions.auto,
                                  size: 200.0,
                                  gapless: false,
                                  errorStateBuilder: (cxt, err) {
                                    return const Center(
                                      child: Text(
                                        'Error generating QR code',
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        InkWell(
                          onTap: (){
                            c.downloadPdf();
                          },
                          child: Container(
                            width: Get.width,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.deepPurple
                            ),
                            child: const Center(
                              child: Text(
                                'bilit indir',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                      ],
                    );
                  }
                ),
              ),
            ),
            GetBuilder<PaymentResultController>(
              init: PaymentResultController(),
              builder: (c) {
                return c.isDownloading?  Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white.withOpacity(.5),
                  child: Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Download Progress: ${c.downloadProgress}",
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 15),
                          const CircularProgressIndicator(),

                        ],
                      ),
                    ),
                  ),
                ):const SizedBox();
              }
            ),
          ],
        ),
      ),
    );
  }
}
