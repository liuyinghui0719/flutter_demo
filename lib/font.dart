import 'package:flutter/material.dart';

// 字体放大动画
class FontAnimation extends StatefulWidget {
  @override
  _FontAnimationState createState() => _FontAnimationState();
}

// TickerProvider提供动画驱动
class _FontAnimationState extends State<FontAnimation> with SingleTickerProviderStateMixin {
  // 补间动画
  late Animation<double> tween;
  // 动画控制对象
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    /**
     * 创建动画控制类对象
     * duration:动画执行的时间 单位是毫秒
     * vsync:防止动画离屏之后继续消耗资源
     */
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    /*创建补间对象*/
    tween = Tween(begin: 0.0, end: 1.0)
        .animate(controller) // 返回Animation对象
      ..addListener(() { // 添加监听
        setState(() {
          print(tween.value); // 打印补间插值
        });
      });
    controller.forward(); // 执行动画
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter动画'),
      ),
      // 添加手势组件
      body: GestureDetector(
        onTap: () {
          // 点击文本重新执行动画
          startAnimation();
        },
        child: Center(
          child: Text(
            "字体放大",
            // 根据动画执行过程中产生的value 更改文本字体大小
            style: TextStyle(fontSize: 60 * tween.value),
          ),
        ),
      ),
    );
  }

  // 重新开始执行动画
  void startAnimation() {
    setState(() {
      // 从起始值执行动画
      controller.forward(from: 0.0);
    });
  }

  // 销毁动画
  @override
  void dispose() {
    // 销毁控制器对象
    controller.dispose();
    super.dispose();
  }
}
