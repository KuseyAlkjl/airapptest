

import 'package:airapp/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../util/app_assets.dart';
import 'controllers/search_controller.dart';
import 'models/destination_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height*.3,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.deepPurple
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Merhaba Kusey',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                            fontSize: 16
                          ),
                        ),
                        Text(
                          'Uçağınızı bulun',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),

                      ],
                    ),
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height*.2,
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
                    GetBuilder<MySearchController>(
                      init: MySearchController(),
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
                              const Text(
                                'Tek yön',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.deepPurple,
                                    fontSize: 20
                                ),
                              ),
                              const SizedBox(height: 30,),
                              TypeAheadField<Ports>(
                                controller: c.takeOffTextController,
                                focusNode: c.takeoffFocus,
                                builder: (context, controller, focusNode) => TextField(
                                  controller: c.takeOffTextController,
                                  focusNode: focusNode,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blue), // Change border color
                                      borderRadius: BorderRadius.circular(15), // Change border radius
                                    ),
                                    hintText: 'Nerden',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        AppAssets.airplaneTakeoff,
                                        color: Colors.black,
                                        width: 20,
                                      ),
                                    ),
                                    suffixIcon: const Icon(Icons.arrow_drop_down),
                                  ),
                                ),

                                suggestionsCallback: (pattern) {
                                  return c.getFilteredPorts(pattern);
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(
                                      suggestion.explanation!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                                onSelected: (suggestion) {
                                  c.saveSelectedTakeOffPort(suggestion);
                                },
                              ),
                              const SizedBox(height: 15,),
                              TypeAheadField<Ports>(
                                controller: c.landingTextController,
                                focusNode: c.landingFocus,
                                builder: (context, controller, focusNode) => TextField(
                                  controller: c.landingTextController,
                                  focusNode: focusNode,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.blue), // Change border color
                                      borderRadius: BorderRadius.circular(15), // Change border radius
                                    ),
                                    hintText: 'Nereye',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        AppAssets.airplaneLanding,
                                        color: Colors.black,
                                        width: 20,
                                      ),
                                    ),
                                    suffixIcon: const Icon(Icons.arrow_drop_down),
                                  ),
                                ),

                                suggestionsCallback: (pattern) {
                                  return c.getFilteredPorts(pattern);
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(
                                      suggestion.explanation!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                                onSelected: (suggestion) {
                                  c.saveSelectedLandingPort(suggestion);
                                },
                              ),
                              const SizedBox(height: 15,),

                              InkWell(
                                onTap: (){
                                  FocusScope.of(context).unfocus();
                                  c.updateFilteredLegs();
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.deepPurple,
                                      width: 2
                                    )
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Ara',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.deepPurple,
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              if(c.isSearched)
                                Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Son arama',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 18
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Get.toNamed(RouteHelper.legsPage,arguments: {
                                            'legs':c.filteredLegs
                                          });
                                        },
                                        child: const Text(
                                          'Hepsini gör',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,
                                              fontSize: 16
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  c.filteredLegs.length!=0?InkWell(
                                    onTap: (){
                                      Get.toNamed(
                                        RouteHelper.legDetailsPage,
                                        arguments: {
                                          'legId':c.filteredLegs[0].legId
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
                                                      c.filteredLegs[0].depPort.toString(),
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.black,
                                                          fontSize: 18
                                                      ),
                                                    ),
                                                    Text(
                                                      c.filteredLegs[0].depTime.toString(),
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
                                                      c.filteredLegs[0].arrPort.toString(),
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.black,
                                                          fontSize: 18
                                                      ),
                                                    ),
                                                    Text(
                                                      c.filteredLegs[0].arrTime.toString(),
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
                                                  c.filteredLegs[0].flightDate.toString(),
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
                                                  c.filteredLegs[0].airline.toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.deepPurple,
                                                      fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  '${c.filteredLegs[0].priceDetail!.salesPrice!.amount.toString()} ${c.filteredLegs[0].priceDetail!.salesPrice!.currency.toString()}',
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
                                  ):SizedBox(
                                    width: Get.width,
                                    height: 200,
                                    child: const Center(
                                      child: Text(
                                        'Uçuş Bulanamadı',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 18
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
