import 'package:airapp/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/seat_controller.dart';



class SeatPage extends StatelessWidget {
  const SeatPage({super.key});


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
                      'Koltuk seç',
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
                    const SizedBox(height: 20),
                    GetBuilder<SeatController>(
                      init: SeatController(),
                      builder: (c) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 90,
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
                                      width: 90,
                                      child: Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  c.legDetails.arrPort.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 18
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IndicatorWidget(color: Colors.white, label: 'Geçerli'),
                                IndicatorWidget(color: Colors.deepPurple, label: 'Seçilmiş'),
                                IndicatorWidget(color: Colors.grey.shade300, label: 'Ayrılmış'),
                              ],
                            ),
                            const SizedBox(height: 30),
                            buildClassSection('Business Class', ['A1', 'A2', '', 'A3', 'A4', 'B1', 'B2', '', 'B3', 'B4'],c),
                            const SizedBox(height: 20),
                            buildClassSection('Economy Class', ['C1', 'C2', '', 'C3', 'C4', 'D1', 'D2', '', 'D3', 'D4'],c),
                            const SizedBox(height: 50),
                            InkWell(
                              onTap: (){

                                if (c.selectedSeat != null) {
                                  Get.toNamed(
                                    RouteHelper.paymentPage,
                                    arguments: {
                                      'legDetails':c.legDetails,
                                      'seat':c.selectedSeat,
                                    }
                                  );
                                } else {
                                  print("No seat selected");
                                }
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
                                    'Koltuk rezervasyon',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClassSection(String className, List<String> seatKeys,SeatController c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(className, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.8,
            ),
            itemCount: seatKeys.length,
            itemBuilder: (context, index) {
              String seatKey = seatKeys[index];
              return seatKey.isEmpty
                  ? Container()
                  : GestureDetector(
                onTap: () {
                  c.selectSeat(seatKey);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: c.getSeatColor(seatKey),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    c.seats[seatKey] == 'booked' ? '' : seatKey,
                    style: TextStyle(
                      color: c.selectedSeat == seatKey ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  final Color color;
  final String label;

  IndicatorWidget({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}