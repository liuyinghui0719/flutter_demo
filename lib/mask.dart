import 'package:flutter/material.dart';

// 遮罩动画
class MaskAnimation extends StatefulWidget {
  @override
  _MaskAnimationState createState() => _MaskAnimationState();
}

class _MaskAnimationState extends State<MaskAnimation> with TickerProviderStateMixin {
  // 动画控制器
  late AnimationController _controller;
  // 宽高补间动画
  late Animation<double> _sizeAnimation;
  // 边框弧度补间动画
  late Animation<BorderRadius?> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    // 创建动画控制器，动画时长为2秒
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // 创建宽高补间动画对象，范围从50.0到200.0
    _sizeAnimation = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      // 设置非线性动画
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    // 创建边框弧度补间动画对象，范围从75.0到0.0
    _borderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(75.0),
      end: BorderRadius.circular(0.0),
    ).animate(
      // 设置非线性动画
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    // 执行动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 动画构建器
    return AnimatedBuilder(
      // 绑定动画控制器
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('遮罩动画'),
          ),
          body: Center(
            // 使用层叠布局展示两个容器
            child: Stack(
              children: <Widget>[
                // 下层容器，始终固定
                Center(
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.black12,
                  ),
                ),
                // 上层容器，根据动画值变化
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: _borderRadiusAnimation.value,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
