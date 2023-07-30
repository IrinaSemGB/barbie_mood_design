import 'package:get/get.dart';

class ScaleAnimationController extends GetxController {
  static ScaleAnimationController get find => Get.find();

  RxBool animateOpacity1 = false.obs;
  int opacityDuration1 = 1800;

  RxBool animateOpacity2 = false.obs;
  int opacityDuration2 = 200;

  RxBool scaleAnimate = false.obs;
  int scaleDuration = 450;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    animateOpacity1.value = true;
    await Future.delayed(Duration(milliseconds: 1800));
    animateOpacity1.value = false;
    animateOpacity2.value = true;
    scaleAnimate.value = true;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = false;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = true;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = false;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = true;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = false;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = true;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = false;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = true;
    await Future.delayed(Duration(milliseconds: scaleDuration));
    scaleAnimate.value = false;
    await Future.delayed(Duration(milliseconds: scaleDuration));
  }
}