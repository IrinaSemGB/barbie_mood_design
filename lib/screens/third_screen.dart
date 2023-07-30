import 'package:barbie_mood_design/constants/app_images.dart';
import 'package:barbie_mood_design/controllers/scale_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../widgets/heart_widget.dart';

class ThirdAnimationScreen extends StatefulWidget {
  const ThirdAnimationScreen({Key? key}) : super(key: key);

  @override
  State<ThirdAnimationScreen> createState() => _ThirdAnimationScreenState();
}

class _ThirdAnimationScreenState extends State<ThirdAnimationScreen> {

  final scaleController = Get.put(ScaleAnimationController());

  @override
  Widget build(BuildContext context) {

    scaleController.startAnimation();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.backgroundGradient,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Image(
                fit: BoxFit.fitHeight,
                image: AssetImage(AppImages.starsDown),
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                opacity: scaleController.animateOpacity2.value ? 1.0 : 0.0,
                duration: Duration(milliseconds: scaleController.opacityDuration2),
                child: Container(
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(AppImages.starsSplash),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Obx(
                () => AnimatedOpacity(
                  opacity: scaleController.animateOpacity1.value ? 0.0 : 1,
                  duration: Duration(milliseconds: scaleController.opacityDuration1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 1.4 : 1.0,
                              duration: Duration(milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.green,
                                rightColor: AppColors.blue,
                              ),
                            ),
                          ),
                          Obx(
                            () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 0.8 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.pink,
                                rightColor: AppColors.yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => AnimatedScale(
                          curve: Curves.bounceOut,
                          scale: scaleController.scaleAnimate.value ? 0.4 : 1.0,
                          duration: Duration(
                              milliseconds: scaleController.scaleDuration),
                          child: Heart(
                            leftColor: AppColors.white,
                            rightColor: AppColors.green,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 1.2 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.violet,
                                rightColor: AppColors.white,
                              ),
                            ),
                          ),
                          Obx(
                                () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 0.5 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.pink,
                                rightColor: AppColors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => AnimatedScale(
                          curve: Curves.bounceOut,
                          scale: scaleController.scaleAnimate.value ? 1.5 : 1.0,
                          duration: Duration(
                              milliseconds: scaleController.scaleDuration),
                          child: Heart(
                            leftColor: AppColors.pink,
                            rightColor: AppColors.pink,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                                () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 0.8 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.green,
                                rightColor: AppColors.yellow,
                              ),
                            ),
                          ),
                          Obx(
                            () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 0.7 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.violet,
                                rightColor: AppColors.yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                            () => AnimatedScale(
                          curve: Curves.bounceOut,
                          scale: scaleController.scaleAnimate.value ? 1.8 : 1.0,
                          duration: Duration(
                              milliseconds: scaleController.scaleDuration),
                          child: Heart(
                            leftColor: AppColors.white,
                            rightColor: AppColors.pink,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 0.3 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.yellow,
                                rightColor: AppColors.pink,
                              ),
                            ),
                          ),
                          Obx(
                            () => AnimatedScale(
                              curve: Curves.bounceOut,
                              scale: scaleController.scaleAnimate.value ? 1.5 : 1.0,
                              duration: Duration(
                                  milliseconds: scaleController.scaleDuration),
                              child: Heart(
                                leftColor: AppColors.blue,
                                rightColor: AppColors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
