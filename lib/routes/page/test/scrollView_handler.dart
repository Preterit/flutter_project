import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ScrollViewHandler extends StatefulWidget {
  @override
  _ScrollViewHandlerState createState() => _ScrollViewHandlerState();
}

const APPBAR_SCROLL_OFFSET = 100;
List _imageUrls = [
  'http://www.yijuzg.com/img/ggimg/096fe739-2d46-4684-9b9f-99fdb801f691-20190228051421.jpg',
  'http://www.yijuzg.com/img/ggimg/9ea4e197-aa5e-4fef-aaa2-93392eb1162e-20190110092133.jpg',
  'http://www.yijuzg.com/img/ggimg/90251d46-99ac-4841-ba91-f5a10def7c53-20190110101218.jpg'
];

class _ScrollViewHandlerState extends State<ScrollViewHandler> {
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            //移除ListView得padding
            removeTop: true, //移除Top
            context: context,
            child: NotificationListener(
              //实现对列表得监听  --  接收 onNotification 得回调，每次滚动得时候都会回调这个函数
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  //1、只监测ListView的滚动（深度设为0），2、监测滚动的时候（ScrollUpdateNotification）
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                //为了实现渐变
                children: <Widget>[
                  Container(
                    height: 160.0,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext contex, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(
                      title: Text('哈哈'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            //改变透明度都可以使用 Opacity 将其包裹
            opacity: appBarAlpha,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
