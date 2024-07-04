import 'package:flutter/material.dart';

// 页面切换动画
class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("页面切换动画图一"),
      ),
      // 点击切换
      body: GestureDetector(
        // 添加动画组件
        child: Hero(
          tag: 'hero-tag',
          child: Image.network(
            "http://gips1.baidu.com/it/u=3874647369,3220417986&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280",
          ),
        ),
        onTap: () {
          // 路由至第二个页面
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DestinationPage();
          }));
        },
      ),
    );
  }
}

// 第二个页面即目标页面
class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("页面切换动画图二"),
      ),
      // 点击返回
      body: GestureDetector(
        // 添加动画组件
        child: Hero(
          tag: 'hero-tag',
          child: Image.network(
            "http://gips0.baidu.com/it/u=1690853528,2506870245&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024",
          ),
        ),
        onTap: () {
          // 页面返回
          Navigator.pop(context);
        },
      ),
    );
  }
}
