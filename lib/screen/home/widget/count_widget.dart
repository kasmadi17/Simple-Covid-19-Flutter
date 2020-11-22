import 'package:covid19/const.dart';
import 'package:flutter/material.dart';

Widget count(String count, Color color, String subTitle) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(6),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(.26),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: color, width: 2),
          ),
        ),
      ),
      SizedBox(height: 20),
      Text(
        count,
        style: TextStyle(
          fontSize: 24,
          color: color,
        ),
      ),
      Text(
        subTitle,
        style: kSubTextStyle,
      ),
    ],
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
