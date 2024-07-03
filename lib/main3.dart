import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupertinoAlertDialog组件示例',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('提示'), // 对话框标题
          content: SingleChildScrollView(
            // 对话框内容部分
            child: ListBody(
              children: const <Widget>[
                Text('是否要删除?'),
                Text('一旦删除数据不可恢复！'),
              ],
            ),
          ),
          // 对话框动作按钮
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
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
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoAlertDialog组件示例'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showCupertinoDialog(context),
          child: Text('显示CupertinoAlertDialog'),
        ),
      ),
    );
  }
}



class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cupertino导航组件集',
      theme: ThemeData.light(), //浅色主题
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    //最外层导航选项卡
    return CupertinoTabScaffold(
      //底部选项卡
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray, //选项卡背景色
        items: const [
          //选项卡项 包含图标及文字
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.conversation_bubble),
            label: '聊天',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        //选项卡绑定的视图
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();
              case 1:
                return ChatPage();
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}

//主页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //基本布局结构，包含内容和导航栏
      navigationBar: const CupertinoNavigationBar(
        //导航栏 只包含中部标题部分
        middle: Text("主页"),
      ),
      child: Center(
        child: Text(
          '主页',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

//聊天页面
class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        //导航栏 包含左中右三部分
        middle: Text("聊天面板"), //中间标题
        trailing: Icon(CupertinoIcons.add), //右侧按钮
        leading: Icon(CupertinoIcons.back), //左侧按钮
      ),
      child: Center(
        child: Text(
          '聊天面板',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}


