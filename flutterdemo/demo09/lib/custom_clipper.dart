import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
//            clipper: BottomClipper(),
            clipper: BottomClipperTest(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

/*class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    //路径开始点
    path.lineTo(0, 0);
    //路径第二个点
    path.lineTo(0, size.height - 50);
    // 第一个控制点
    var firstControlPoint = Offset(size.width/2, size.height);
    //第一个控制结束点
    var firstEndPoint = Offset(size.width, size.height - 50);
    // 设置控制点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // 路径第三个点
    path.lineTo(size.width, size.height - 50);
    // 路径结束点
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}*/

class BottomClipperTest extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    //路径开始点
    path.lineTo(0, 0);
    //路径第二个点
    path.lineTo(0, size.height - 50);
    // 第一个控制点
    var firstControlPoint = Offset(size.width / 4, size.height + 50);
    //第一个控制结束点
    var firstEndPoint = Offset(size.width / 2, size.height - 50);
    // 设置控制点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    ;
    // 第二个控制点
    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 150);
    //第二个控制结束点
    var secondEndPoint = Offset(size.width, size.height - 50);
    // 设置控制点
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // 路径第三个点
    path.lineTo(size.width, size.height - 50);
    // 路径结束点
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
