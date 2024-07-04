import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Opacity不透明度示例',
      home: LayoutDemo(),
    ),
  );
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoxDecoration装饰盒子-边框阴影示例'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.white,
            // 边框阴影效果 可添加多个BoxShadow 是一种组合效果
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.grey, // 阴影颜色
                blurRadius: 8.0, // 模糊值
                spreadRadius: 8.0, // 扩展阴影半径
                offset: Offset(-1.0, 1.0), // x/y方向偏移量
              ),
            ],
            //线性渐变
            // gradient: LinearGradient(
            //   begin: const FractionalOffset(0.5, 0.0),//起始偏移量
            //   end: const FractionalOffset(1.0, 1.0),//终止偏移量
            //   //渐变颜色数据集
            //   colors: <Color>[
            //     Colors.red,
            //     Colors.green,
            //     Colors.blue,
            //     Colors.grey,
            //   ],
            // ),
            //环形渐变
            gradient: RadialGradient(
              //中心点偏移量,x和y均为0.0表示在正中心位置
              center: const Alignment(-0.0, -0.0),
              //圆形半径
              radius: 0.50,
              //渐变颜色数据集
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'BoxShadow阴影效果',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LayoutDemo2 extends StatelessWidget {
  const LayoutDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoxDecoration装饰盒子-背景图示例'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          // 装饰器
          decoration: BoxDecoration(
            // 背景色
            color: Colors.grey,
            // 图片装饰器
            image: const DecorationImage(
              image: ExactAssetImage('./lib/images/1.jpeg'), // 添加image属性
              fit: BoxFit.cover, // 填充类型
            ),
            borderRadius: BorderRadius.circular(180.0),
          ),
        ),
      ),
    );
  }
}

class LayoutDemo1 extends StatelessWidget {
  const LayoutDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity不透明度示例'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.05, // 不透明度设置为0.3
          child: Container(
            width: 250.0,
            height: 100.0,
            // 添加装饰器
            decoration: const BoxDecoration(
              color: Colors.black, // 背景色设置为纯黑
            ),
            child: const Center(
              child: Text(
                '不透明度为0.3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


