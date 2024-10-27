import 'package:airapp/features/legs/legs_page.dart';
import 'package:get/get.dart';

import '../features/leg_details/leg_details_page.dart';
import '../features/payment/payment_page.dart';
import '../features/payment_result/payment_result_page.dart';
import '../features/search/search_page.dart';
import '../features/seat/seat_page.dart';


class RouteHelper {
  static const String searchPage = '/';
  static const String legsPage = '/legsPage';
  static const String legDetailsPage = '/legDetailsPage';
  static const String seatPage = '/seatPage';
  static const String paymentPage = '/paymentPage';
  static const String paymentResulPage = '/paymentResulPage';



  static List<GetPage> routes = [
    GetPage(name: searchPage, page: () =>  const SearchPage()),
    GetPage(name: legsPage, page: () =>  const LegsPage()),
    GetPage(name: legDetailsPage, page: () =>  const LegDetailsPage()),
    GetPage(name: seatPage, page: () => const SeatPage()),
    GetPage(name: paymentPage, page: () => const PaymentPage()),
    GetPage(name: paymentResulPage, page: () => const PaymentResultPage()),
    ];

}