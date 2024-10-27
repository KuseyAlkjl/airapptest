import 'package:airapp/helper/route_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_card_scanner/ml_card_scanner.dart';
import '../../common/widgets/custom_text_field_widget.dart';
import 'controllers/payment_controller.dart';


class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
                      'Ödeme',
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
                    GetBuilder<PaymentController>(
                        init: PaymentController(),
                        builder: (c) {
                          if(c.isLoading){
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                            );
                          }else{
                            return Form(
                              key: c.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 50,),

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
                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        children: [
                                          Text(
                                            'Sipariş numarası',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13
                                            ),
                                          ),
                                          Text(
                                            '888888',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontSize: 15
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        c.legDetails.airline.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple,
                                            fontSize: 15
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Toplam tutar',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13
                                            ),
                                          ),
                                          Text(
                                            '${c.legDetails.priceDetail!.salesPrice!.amount} ${c.legDetails.priceDetail!.salesPrice!.currency}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.orange,
                                                fontSize: 15
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 50,),
                                  CustomTextFieldWidget(
                                    controller: c.cardNumber,
                                    inputType: TextInputType.number,
                                    hintText: 'add card number',
                                    labelText: 'Card number',
                                    suffixIcon:InkWell(
                                      onTap: (){
                                        c.clearCardInfo();
                                        Get.to(const ReadCardScreen());
                                      },
                                      child: const Icon(
                                          Icons.camera_alt_outlined
                                      ),
                                    ) ,
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: Get.width*.4,
                                        height: 50,
                                        child: CustomTextFieldWidget(
                                          controller: c.expirationDate,
                                          readOnly: true,
                                          labelText: 'Expiration date',
                                          hintText: 'MM/YY',
                                          onTap: () => c.selectDate(context),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width*.4,
                                        height: 50,
                                        child: CustomTextFieldWidget(
                                          controller: c.cvcNumber,
                                          inputType: TextInputType.number,
                                          labelText: 'CVC-CVV',
                                          hintText: 'Güvenlik kod',
                                          type: 'cvc',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 150,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Siparişiniz ödemesini yapın',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14
                                        ),
                                      ),
                                      Text(
                                        '${c.legDetails.priceDetail!.salesPrice!.amount} ${c.legDetails.priceDetail!.salesPrice!.currency}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.orange,
                                            fontSize: 15
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  InkWell(
                                    onTap: (){
                                      if (c.formKey.currentState!.validate()) {
                                        c.formKey.currentState!.save();
                                      } else {
                                        c.autoValidateMode = AutovalidateMode.always;
                                        return;
                                      }
                                      Get.toNamed(
                                        RouteHelper.paymentResulPage,
                                        arguments: {
                                          'legDetails':c.legDetails,
                                          'seat':c.seat,
                                        }
                                      );
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
                                          'Satın al',
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
                              ),
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

class ReadCardScreen extends StatefulWidget {
  const ReadCardScreen({super.key});

  @override
  State<ReadCardScreen> createState() => _ReadCardScreenState();
}

class _ReadCardScreenState extends State<ReadCardScreen> {
  final ScannerWidgetController _controller = ScannerWidgetController();

  @override
  void initState() {
    super.initState();
    _controller
      ..setCardListener(_onListenCard)
      ..setErrorListener(_onError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScannerWidget(
        controller: _controller,
        overlayOrientation: CardOrientation.landscape,
        cameraResolution: CameraResolution.high,
        oneShotScanning: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller
      ..removeCardListeners(_onListenCard)
      ..removeErrorListener(_onError)
      ..dispose();
    super.dispose();
  }

  void _onListenCard(CardInfo? value) {
    if (value != null) {
      Get.find<PaymentController>().setCardInfo(value);
      Get.back();
    }
  }

  void _onError(ScannerException exception) {
    if (kDebugMode) {
      print('Error: ${exception.message}');
    }
  }
}