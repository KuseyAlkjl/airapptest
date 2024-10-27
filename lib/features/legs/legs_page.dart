

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/route_helper.dart';
import 'controllers/legs_controller.dart';

class LegsPage extends StatelessWidget {
  const LegsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height*.4,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  color: Colors.deepPurple
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                          'Tek yön',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                        const Icon(
                          Icons.notifications_none_outlined,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    GetBuilder<LegsController>(
                        init: LegsController(),
                        builder: (c) {
                          if(c.isLoading){
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                            );
                          }else{
                            return Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white.withOpacity(.2)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        c.legsModel![0].depPort.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 18
                                        ),
                                      ),
                                      Icon(
                                        Icons.flight,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        c.legsModel![0].arrPort.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 18
                                        ),
                                      ),
                                      Icon(
                                        Icons.edit,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text(
                                        c.legsModel![0].flightDate.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white70,
                                            fontSize: 13
                                        ),
                                      ),
                                      const SizedBox(width: 12,),
                                      const SizedBox(
                                        width: 1.5,
                                        child: Divider(
                                          height: 20,
                                          thickness: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      const SizedBox(width: 12,),
                                      const Text(
                                        'Business',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white70,
                                            fontSize: 13
                                        ),
                                      ),
                                      const SizedBox(width: 12,),
                                      const SizedBox(
                                        width: 1.6,
                                        child: Divider(
                                          height: 25,
                                          thickness: 25,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      const SizedBox(width: 12,),
                                      const Text(
                                        '1 Koltuk',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white70,
                                            fontSize: 13
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }

                        }
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height*.32,
              child: Container(
                height: Get.height-Get.height*.38,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(12),
                child: GetBuilder<LegsController>(
                  init: LegsController(),
                  builder: (c) {
                    if(c.isLoading){
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      );
                    }else{
                      return ListView.builder(
                        itemCount: c.legsModel!.length,
                        itemBuilder: (_,index){
                          return InkWell(
                            onTap: (){
                              Get.toNamed(
                                  RouteHelper.legDetailsPage,
                                  arguments: {
                                    'legId':c.legsModel![index].legId
                                  }
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Durmadan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.deepPurple,
                                              fontSize: 14
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: const Color(0xFF5ED263)
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'The fastest',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                  fontSize: 12
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              c.legsModel![index].depPort.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            Text(
                                              c.legsModel![index].depTime.toString(),
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
                                              c.legsModel![index].arrPort.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 18
                                              ),
                                            ),
                                            Text(
                                              c.legsModel![index].arrTime.toString(),
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
                                    const SizedBox(height: 15,),
                                    Row(
                                      children: [
                                        Text(
                                          c.legsModel![index].flightDate.toString(),
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
                                    const SizedBox(height: 20,),
                                    SizedBox(
                                      width: Get.width,
                                      child: const Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          c.legsModel![index].airline.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepPurple,
                                              fontSize: 20
                                          ),
                                        ),
                                        Text(
                                          '${c.legsModel![index].priceDetail!.salesPrice!.amount.toString()} ${c.legsModel![index].priceDetail!.salesPrice!.currency.toString()}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                              fontSize: 18
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }

                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
