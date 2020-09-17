import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color bgColor;
  
  RowButton(
    this.title,
    this.onTap, {
    this.bgColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: ScreenUtil().setHeight(80),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                // side: BorderSide(color: Colors.red),
              ),
              color: bgColor,
              onPressed: onTap,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(32),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
