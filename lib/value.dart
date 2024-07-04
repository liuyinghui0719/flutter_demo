import 'package:flutter/material.dart';

class ValueAnimation extends StatefulWidget {
  @override
  _ValueAnimationState createState() => _ValueAnimationState();
}

class _ValueAnimationState extends State<ValueAnimation> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // 使用 IntTween 而不是普通的 Tween<int>
    animation = IntTween(begin: 0, end: 6).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        Navigator.pop(context);
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('数字变化动画'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Text(
              animation.value.toString(),
              style: TextStyle(fontSize: 48.0),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
