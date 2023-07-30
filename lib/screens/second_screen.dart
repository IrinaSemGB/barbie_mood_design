import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/heart_widget.dart';


class SecondAnimationScreen extends StatefulWidget {
  const SecondAnimationScreen({Key? key}) : super(key: key);

  @override
  State<SecondAnimationScreen> createState() => _SecondAnimationScreenState();
}


extension on VoidCallback {
  Future<void> delayed(Duration duration) => Future.delayed(duration, this);
}

class _SecondAnimationScreenState extends State<SecondAnimationScreen> with TickerProviderStateMixin {

  final int bit = 900;

  late AnimationController _clockwiseAnimationController;
  late Animation<double> _clockwiseAnimation;

  late AnimationController _flipAnimationController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();

    _clockwiseAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: bit),
    );

    _clockwiseAnimation = Tween<double>(begin: 0.0, end: -(pi / 2)).animate(
      CurvedAnimation(
        parent: _clockwiseAnimationController,
        curve: Curves.bounceOut,
      ),
    );

    _flipAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: bit),
    );
    _flipAnimation = Tween<double>(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: _flipAnimationController, curve: Curves.bounceOut),
    );

    _clockwiseAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(begin: _flipAnimation.value, end: _flipAnimation.value + pi).animate(
          CurvedAnimation(parent: _flipAnimationController, curve: Curves.bounceOut),
        );
        _flipAnimationController..reset()..forward();
      }
    });

    _flipAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _clockwiseAnimation = Tween<double>(
          begin: _clockwiseAnimation.value,
          end: _clockwiseAnimation.value + -(pi / 2),
        ).animate(
          CurvedAnimation(
            parent: _clockwiseAnimationController,
            curve: Curves.bounceOut,
          ),
        );
        _clockwiseAnimationController..reset()..forward();
      }
    });
  }

  @override
  void dispose() {
    _clockwiseAnimationController.dispose();
    _flipAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _flipAnimationController..reset()..forward.delayed(Duration(milliseconds: 1000));

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
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _clockwiseAnimationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _clockwiseAnimationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
                    child: AnimatedBuilder(
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
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _clockwiseAnimationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _clockwiseAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateZ(_clockwiseAnimation.value),
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
                      );
                    },
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
