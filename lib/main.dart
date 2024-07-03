import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 设置用户信息 头像、用户名、Email等
            UserAccountsDrawerHeader(
              accountName: Text(
                "玄微子",
              ),
              accountEmail: Text(
                "xuanweizi@163.com",
              ),
              // 设置当前用户头像
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/1.jpeg"),
              ),
              onDetailsPressed: () {},
              // 属性本来是用来设置当前用户的其他账号的头像 这里用来当QQ二维码图片展示
              otherAccountsPictures: <Widget>[
                Container(
                  child: Image.asset('images/code.jpeg'),
                ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.color_lens),
              ), // 导航栏菜单
              title: Text('个性装扮'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.photo),
              ),
              title: Text('我的相册'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.wifi),
              ),
              title: Text('免流量特权'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    var card = SizedBox(
      // 限定高度
      height: 350.0,
      // 添加Card组件
      child: Card(
        // 垂直布局
        child: Column(
          children: <Widget>[
            ListTile(
              // 标题
              title: const Text(
                '深圳市南山区深南大道',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              // 子标题
              subtitle: const Text('XX有限公司'),
              // 左侧图标
              leading: const Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            // 分隔线
            const Divider(),
            ListTile(
              title: const Text(
                '深圳市罗湖区沿海大道',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: const Text('XX培训机构'),
              leading: const Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Card布局示例'),
        ),
        body: Center(
          child: card,
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //当前选中项的索引
  int _selectedIndex = 1;
  //导航栏按钮选中对应数据
  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //顶部应用按钮
      appBar: AppBar(
        title: Text('BottomNavigationBar示例'),
      ),
      //中间内容显示区域
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), //居中显示某一个文本
      ),
      //底部导航按钮集
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          //底部导航按钮项 包含图标及文本
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '信息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '发现',
          ),
        ],
        currentIndex: _selectedIndex, //当前选中项的索引
        selectedItemColor: Colors.deepPurple, //选项中项的颜色
        onTap: _onItemTapped, //选择按下处理
      ),
    );
  }

  //选择按下处理 设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
