import 'package:get/get.dart';

class OpacityAnimationController extends GetxController {
  static OpacityAnimationController get find => Get.find();

  RxBool animate1 = false.obs;
  RxBool animate2 = false.obs;
  RxBool animate3 = false.obs;
  RxBool animate4 = false.obs;
  RxBool animate5 = false.obs;
  final int opacityDuration = 200;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 2800));
    animate1.value = true;
    await Future.delayed(Duration(milliseconds: 900));
    animate2.value = true;
    await Future.delayed(Duration(milliseconds: 900));
    animate3.value = true;
    await Future.delayed(Duration(milliseconds: 900));
    animate4.value = true;
    await Future.delayed(Duration(milliseconds: 900));
    animate5.value = true;
  }
}