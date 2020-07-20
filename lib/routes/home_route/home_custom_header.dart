/*
* Date:2020/7/20
* author:lwb
* Desc: 首页自定义的头部刷新布局
*/
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomHomeHeader extends RefreshIndicator {
  final int durationSeconds;

  CustomHomeHeader({this.durationSeconds = 1})
      : super(height: 80.0, refreshStyle: RefreshStyle.Follow);

  @override
  _CustomHomeHeaderState createState() {
    return _CustomHomeHeaderState();
  }
}

class _CustomHomeHeaderState extends RefreshIndicatorState<CustomHomeHeader>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<int> _animation;
  String tagStr = "正在刷新数据";

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 850))
      ..repeat();
    _animation = new IntTween(begin: 1, end: 45).animate(_controller);
    //widget.entry.lowIndex 表示从第几下标开始，如0；widget.entry.highIndex表示最大下标：如7
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 正在刷新是执行 "GIF动画"
  @override
  void onModeChange(RefreshStatus mode) {
    switch (mode){
      case RefreshStatus.idle:
        /// 结束
        print("onModeChange --- idle");
        break;
      case RefreshStatus.refreshing:
        /// 刷新状态
        print("onModeChange --- refreshing");
        break;
      case RefreshStatus.twoLevelOpening:
        print("onModeChange --- twoLevelOpening");
        break;
    }
    super.onModeChange(mode);
  }


  /// 刷新结束
//  @override
//  Future<void> endRefresh() {
//    _gifController.value = 30;
//    return _gifController.animateTo(59, duration: Duration(milliseconds: 500));
//  }

  /// 重置状态
  @override
  void resetValue() {
    super.resetValue();
  }

  @override
  Future<void> readyToRefresh() {
    print("onModeChange --- readyToRefresh");
    return super.readyToRefresh();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    return Container(
      height: 80.0,
      child: Center(
        child: Column(
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => creaImg(),
            ),
            SizedBox(height:5.0),
            Text(
              tagStr,
              style: TextStyle(
                fontSize: 10.0,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget creaImg() {
    return Image.asset(
//      imgUrlList[_animation.value],
      "assets/images/loadgif/drop_000${_animation.value < 10 ? "0${_animation.value}" : _animation.value}.png",
      gaplessPlayback: true, //避免图片闪烁
      width: 50.0,
      height: 50.0,
    );
  }
}
