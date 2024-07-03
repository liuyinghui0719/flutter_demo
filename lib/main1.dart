import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main1() {
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AlertDialog组件示例'),
        ),
        body: const Center(
          child: AlertDialogDemo(),
        ),
      ),
    );
  }
}

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({super.key});

  void _showDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('是否要删除?'),
                Text('一旦删除数据不可恢复！'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showDialog(context),
      child: const Text('显示对话框'),
    );
  }
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //应用按钮
      appBar: AppBar(
        //左侧图标
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            // 在这里添加你的点击响应逻辑
            print('Home button clicked');
          },
        ),
        //标题
        title: Text('AppBar应用按钮示例'),
        //操作按钮集
        actions: <Widget>[
          //图标按钮
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  //用户名
  late String userName;
  //密码
  late String password;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;

    //验证Form表单
    if (loginForm!.validate()) {
      loginForm.save();
      print('userName:' + userName + ' password:' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form表单示例'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            //添加内边距
            padding: const EdgeInsets.all(16.0),
            //添加Form表单
            child: Form(
              key: loginKey,
              child: Column(
                children: <Widget>[
                  //文本输入框表单组件
                  TextFormField(
                    //装饰器
                    decoration: InputDecoration(
                      //提示文本
                      labelText: '请输入用户名',
                    ),
                    //接收输入值
                    onSaved: (value) {
                      userName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '请输入密码',
                    ),
                    obscureText: true,
                    //验证表单方法
                    validator: (value) {
                      return value!.length < 6 ? "密码长度不够6位" : null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                ],
              ),
            ),
          ),
          //限定容器大小
          SizedBox(
            width: 340.0,
            height: 42.0,
            //添加登录按钮
            child: ElevatedButton(
              onPressed: login,
              child: Text(
                '登录',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("aaaa"),
          backgroundColor: Colors.green,
        ),
        //添加容器
        //添加基础列表
        //使用GridView.count构建网格
        body: GridView.count(
          primary: false,
          //四周增加一定的空隙
          padding: const EdgeInsets.all(0.0),
          crossAxisSpacing: 1.0,
          //一行上放三列数据
          crossAxisCount: 5,
          //数据项 五行三列
          children: const <Widget>[
            Text('第一行第一列'),
            Text('第一行第二列'),
            Text('第一行第三列'),
            Text('第二行第一列'),
            Text('第二行第二列'),
            Text('第二行第三列'),
            Text('第三行第一列'),
            Text('第三行第二列'),
            Text('第三行第三列'),
            Text('第四行第一列'),
            Text('第四行第二列'),
            Text('第四行第三列'),
            Text('第五行第一列'),
            Text('第五行第二列'),
            Text('第五行第三列'),
          ],
        ),
      ),
    );
  }
}


class _MyHomePageState4 extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      //垂直布局
      body: Column(
        children: <Widget>[
          //文本组件
          Text(
            '红色字体+黑色删除线+18号+斜体+粗体',
            //文本样式
            style: TextStyle(
              //字体颜色
              color: const Color(0xffff0000),
              //文本装饰器(删除线)
              decoration: TextDecoration.lineThrough,
              //文本装饰器颜色(删除线颜色)
              decorationColor: const Color(0xff000000),
              //字体大小
              fontSize: 18.0,
              //字体样式 是否斜体
              fontStyle: FontStyle.italic,
              //字体粗细
              fontWeight: FontWeight.bold,
              //文字间距
              letterSpacing: 2.0,
            ),
          ),
          Text(
            '橙色+下划线+24号',
            style: TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 24.0,
            ),
          ),
          Text(
            '上划线+虚线+23号',
            style: TextStyle(
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23.0,
              //字体样式
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            '23号+斜体+加粗+字间距6',
            style: TextStyle(
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              letterSpacing: 6.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyHomePageState3 extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    //居中展示
    return Center(
      //添加网络图片
      child: Image.network(
        //图片url
        'https://flutter.io/images/flutter-mark-square-100.png',
        //填充模式
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _MyHomePageState2 extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '容器组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器组件示例'),
        ),
        body: Center(
          //添加容器
          child: Container(
            width: 200.0,
            height: 200.0,
            //添加边框装饰效果
            decoration: BoxDecoration(
              color: Colors.white,
              //设置上下左右四个边框样式
              border: new Border.all(
                color: Colors.grey, //边框颜色
                width: 8.0, //边框粗细
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(8.0)), //边框的弧度
            ),
            child: Text(
              'Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ),
      ),
    );
  }




}

class _MyHomePageState1 extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });
    const url = 'https://www.baidu.com';
    //调用url_launcher包里的launch方法
    launch(url);

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}