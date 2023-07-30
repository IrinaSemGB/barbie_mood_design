import 'dart:math';
import 'package:barbie_mood_design/widgets/heart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/opacity_animation_controller.dart';


class FirstAnimationScreen extends StatefulWidget {
  const FirstAnimationScreen({super.key});

  @override
  State<FirstAnimationScreen> createState() => _FirstAnimationScreenState();
}

extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}


class _FirstAnimationScreenState extends State<FirstAnimationScreen> with SingleTickerProviderStateMixin {

  final opacityController = Get.put(OpacityAnimationController());

  final int bit = 900;

  late AnimationController _flipAnimationController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();

    _flipAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: bit),
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: _flipAnimationController, curve: Curves.bounceOut),
    );

    _flipAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(begin: _flipAnimation.value, end: _flipAnimation.value + pi).animate(
          CurvedAnimation(parent: _flipAnimationController, curve: Curves.bounceOut),
        );
        _flipAnimationController..reset()..forward();
      }
    });
  }

  @override
  void dispose() {
    _flipAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _flipAnimationController..reset()..forward.delayed(Duration(milliseconds: 1000));

    opacityController.startAnimation();

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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate4.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.green,
                              rightColor: AppColors.blue,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate5.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.pink,
                              rightColor: AppColors.yellow,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => AnimatedOpacity(
                  opacity: opacityController.animate3.value ? 1.0 : 0,
                  duration: Duration(milliseconds: opacityController.opacityDuration),
                  child: AnimatedBuilder(
                    animation: _flipAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                        child: Heart(
                          leftColor: AppColors.white,
                          rightColor: AppColors.green,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate2.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.violet,
                              rightColor: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate1.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.pink,
                              rightColor: AppColors.blue,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _flipAnimationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                    child: Heart(
                      leftColor: AppColors.pink,
                      rightColor: AppColors.pink,
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                  () => AnimatedOpacity(
                      opacity: opacityController.animate1.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.green,
                              rightColor: AppColors.yellow,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate2.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.violet,
                              rightColor: AppColors.yellow,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => AnimatedOpacity(
                  opacity: opacityController.animate3.value ? 1.0 : 0,
                  duration: Duration(milliseconds: opacityController.opacityDuration),
                  child: AnimatedBuilder(
                    animation: _flipAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                        child: Heart(
                          leftColor: AppColors.white,
                          rightColor: AppColors.pink,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate5.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.yellow,
                              rightColor: AppColors.pink,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: opacityController.animate4.value ? 1.0 : 0,
                      duration: Duration(milliseconds: opacityController.opacityDuration),
                      child: AnimatedBuilder(
                        animation: _flipAnimationController,
                        builder: (BuildContext context, Widget? child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(_flipAnimation.value),
                            child: Heart(
                              leftColor: AppColors.blue,
                              rightColor: AppColors.green,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


