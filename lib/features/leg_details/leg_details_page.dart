

import 'package:airapp/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../seat/seat_page.dart';
import 'controllers/leg_details_controller.dart';

class LegDetailsPage extends StatelessWidget {
  const LegDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Detaylar',
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
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    GetBuilder<LegDetailsController>(
                      init: LegDetailsController(),
                      builder: (c) {
                        if(c.isLoading){
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.deepPurple,
                            ),
                          );
                        }else{
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
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
                                              fontSize: 11
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
                                              fontSize: 11
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    c.legDetails.flightDate.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                        fontSize: 13
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  const SizedBox(
                                    width: 1.5,
                                    child: Divider(
                                      height: 20,
                                      thickness: 20,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  const Text(
                                    'Business',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                        fontSize: 13
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  const SizedBox(
                                    width: 1.6,
                                    child: Divider(
                                      height: 25,
                                      thickness: 25,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  const Text(
                                    '1 Koltuk',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                        fontSize: 13
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),
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
                                  Column(
                                    children: [
                                      const Text(
                                        'Business class',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15
                                        ),
                                      ),
                                      Text(
                                        '${c.legDetails.priceDetail!.salesPrice!.amount.toString()} ${c.legDetails.priceDetail!.salesPrice!.currency.toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 12
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),
                              const Text(
                                'Ücret dağılımı',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Temel ücreti',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    '${c.legDetails.priceDetail!.basePrice!.amount.toString()} ${c.legDetails.priceDetail!.salesPrice!.currency.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Ücret ve Ek ücretler',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    '${c.legDetails.priceDetail!.surcharge!.amount.toString()} ${c.legDetails.priceDetail!.salesPrice!.currency.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Seyahat sigortası',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    '${c.legDetails.priceDetail!.totalTax!.amount.toString()} ${c.legDetails.priceDetail!.salesPrice!.currency.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Toplam ücreti',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    '${c.legDetails.priceDetail!.salesPrice!.amount.toString()} ${c.legDetails.priceDetail!.salesPrice!.currency.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        fontSize: 14
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  InkWell(
                                    onTap: ()=> Get.back(),
                                    child: Container(
                                      width: Get.width*.45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                           width: 2,
                                          color: Colors.deepPurple
                                          ),

                                      ),
                                      child: const Center(
                                        child: Text(
                                          'İptal',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Get.toNamed(
                                        RouteHelper.seatPage,
                                        arguments: {
                                          'legDetails':c.legDetails
                                        }
                                      );
                                    },
                                    child: Container(
                                      width: Get.width*.45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.deepPurple
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Koltuk seç',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }

                      }
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
