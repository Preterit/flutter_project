/*
* Date:2020/7/28
* author:lwb
* Desc: 横向的进度条
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorProcress extends StatelessWidget {
  final double progress;
  double width = 100;
  double height = 5;
  double radius = 5;

  HorProcress(this.progress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 242, 242, 242)),
            ),
            Positioned(
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                child: Container(
                  width: progress / 100 * width,
                  height: height,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(242, 239, 201, 163)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
