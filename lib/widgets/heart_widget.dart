import 'package:flutter/cupertino.dart';


enum HeartSide { left, right }

extension ToPath on HeartSide {

  Path toPath(Size size) {
    var path = Path();

    switch (this) {

      case HeartSide.left:
        path.moveTo(size.width, size.height * 0.15);
        path.cubicTo(
            size.width * 0.5, size.height * -0.30,
            size.width * -0.15, size.height * 0.5,
            size.width, size.height); break;
      case HeartSide.right:
        path.moveTo(0.0, size.height * 0.15);
        path.cubicTo(
            size.width * 0.5, size.height * -0.30,
            size.width * 1.15, size.height * 0.5,
            0.0, size.height); break;
    }

    path.close();
    return path;
  }
}

class HalfHeartClipper extends CustomClipper<Path> {

  final HeartSide side;
  HalfHeartClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class Heart extends StatelessWidget {

  final Color leftColor;
  final Color rightColor;

  const Heart({
    super.key,
    required this.leftColor,
    required this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
          clipper: HalfHeartClipper(side: HeartSide.left),
          child: Container(
            width: 60.0,
            height: 60.0,
            color: leftColor,
          ),
        ),
        ClipPath(
          clipper: HalfHeartClipper(side: HeartSide.right),
          child: Container(
            width: 60.0,
            height: 60.0,
            color: rightColor,
          ),
        ),
      ],
    );
  }
}