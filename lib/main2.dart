import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage3(),
      title: 'MaterialApp示例',
      //路由配置
      routes: {
        '/first': (BuildContext context) => const FirstPage(), //添加路由
        '/second': (BuildContext context) => const SecondPage(),
      },
      initialRoute: '/first', //初始路由页面为first页面
    );
  }
}

//这是一个可改变的Widget
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  _MyHomePageState3 createState() => _MyHomePageState3();
}

class _MyHomePageState3 extends State<MyHomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp示例'),
      ),
      body: const Center(
        child: Text(
          '主页',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}

//第一个路由页面
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('这是第一页'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //路由跳转到第二个页面
            Navigator.pushNamed(context, '/second');
          },
          child: const Text(
            '这是第一页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}

//第二个路由页面
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('这是第二页'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //路由跳转到第一个页面
            Navigator.pushNamed(context, '/first');
          },
          child: const Text(
            '这是第二页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}



class MyApp15 extends StatelessWidget {
  // 这是整个应用的主组件
  const MyApp15({super.key});

  @override
  Widget build(BuildContext context) {
    // Material 风格应用
    return MaterialApp(
      // 设置首页
      home: const MyHomePage2(),
      title: 'MaterialApp示例',
      // 添加主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

// 这是一个可改变的 Widget
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp示例'),
      ),
      body: const Center(
        child: Text(
          '主页',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}


// void main() => runApp(
//   const MaterialApp(
//     title: 'Scaffold脚手架组件示例',
//     home: LayoutDemo2(),
//   ),
// );

class LayoutDemo2 extends StatelessWidget {
  const LayoutDemo2({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //头部元素 比如：左侧返回按钮 中间标题 右侧菜单
      appBar: AppBar(
        title: Text('Scaffold脚手架组件示例'),
      ),
      //视图内容部分 通常作为应用页面的主显示区域
      body: Center(
        child: Text('Scaffold'),
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(), // 加上这一行，确保 FAB 不遮挡底部栏
        child: Container(height: 50.0,),
      ),
      //添加FAB按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 在此处处理按钮点击事件
          print('FAB 被点击了');
        },
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      //FAB按钮居中展示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

enum ConferenceItem { AddMember, LockConference, ModifyLayout, TurnoffAll }

// void main() {
//   runApp(const MyApp());
// }

class MyApp14 extends StatelessWidget {
  const MyApp14({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupMenuButton组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuButton组件示例'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: PopupMenuButton<ConferenceItem>(
              onSelected: (ConferenceItem result) {
                // 处理选择的菜单项
                switch (result) {
                  case ConferenceItem.AddMember:
                    print("添加成员");
                    break;
                  case ConferenceItem.LockConference:
                    print("锁定会议");
                    break;
                  case ConferenceItem.ModifyLayout:
                    print("修改布局");
                    break;
                  case ConferenceItem.TurnoffAll:
                    print("挂断所有");
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<ConferenceItem>>[
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.AddMember,
                  child: Text('添加成员'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.LockConference,
                  child: Text('锁定会议'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.ModifyLayout,
                  child: Text('修改布局'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.TurnoffAll,
                  child: Text('挂断所有'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//TODO：  需要解决BUG
class MyApp13 extends StatelessWidget {
  const MyApp13({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleDialog 示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialog 示例'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text('对话框标题'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context); // 关闭对话框
                        },
                        child: const Text('第一行信息'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context); // 关闭对话框
                        },
                        child: const Text('第二行信息'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('打开对话框'),
          ),
        ),
      ),
    );
  }
}

class MyApp12 extends StatelessWidget {
  const MyApp12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar示例'),
        ),
        body: Center(
          child: Text(
            'SnackBar示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                // 点击回调事件 弹出一句提示语句
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("显示SnackBar"),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class MyApp11 extends StatelessWidget {
  // 选项卡数据
  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项卡一'),
    Tab(text: '选项卡二'),
  ];

   MyApp11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 用来组装TabBar及TabBarView
      home: DefaultTabController(
        // 选项卡长度
        length: myTabs.length,
        child: Scaffold(
          // 应用栏
          appBar: AppBar(
            // 页面标题
            title: const Text("AppBar标题"),
            // 添加选项卡按钮，注意此bottom表示在AppBar的底部，在整个页面上来看还处于顶部区域
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),
          // 添加选项卡视图即页面中间内容显示区域
          body: TabBarView(
            // 使用map迭代显示中间内容
            children: myTabs.map((Tab tab) {
              return Center(child: Text(tab.text ?? '')); // 使用空安全处理
            }).toList(),
          ),
        ),
      ),
    );
  }
}


class MyApp10 extends StatelessWidget {
  const MyApp10({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar选项卡示例',
      home: TabBarSample(),
    );
  }
}

class TabBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar选项卡示例'),
          bottom: TabBar(
            isScrollable: false,
            tabs: items.map((ItemView item) {
              return Tab(
                text: item.title,
                icon: Icon(item.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: items.map((ItemView item) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectedView(item: item),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ItemView {
  const ItemView({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<ItemView> items = const <ItemView>[
  const ItemView(title: '自驾', icon: Icons.directions_car),
  const ItemView(title: '自行车', icon: Icons.directions_bike),
  const ItemView(title: '轮船', icon: Icons.directions_boat),
  const ItemView(title: '公交车', icon: Icons.directions_bus),
  const ItemView(title: '火车', icon: Icons.directions_railway),
  const ItemView(title: '步行', icon: Icons.directions_walk),
];

class SelectedView extends StatelessWidget {
  const SelectedView({Key? key, required this.item}) : super(key: key);

  final ItemView item;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.labelSmall!;
    return Card(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(item.icon, size: 128.0, color: textStyle.color),
            Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}


class MyApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //添加文本编辑控制器 监听文本输入内容变化
    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print('你输入的内容为: ${controller.text}');
    });

    return MaterialApp(
      title: 'TextField组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField组件示例'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //绑定controller
              controller: controller,
              //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
              maxLength: 30,
              //最大行数
              maxLines: 1,
              //是否自动更正
              autocorrect: true,
              //是否自动对焦
              autofocus: true,
              //是否是密码
              obscureText: false,
              //文本对齐方式
              textAlign: TextAlign.center,
              //输入文本的样式
              style: TextStyle(fontSize: 26.0, color: Colors.green),
              //文本内容改变时回调
              onChanged: (text) {
                print('文本内容改变时回调 $text');
              },
              //内容提交时回调
              onSubmitted: (text) {
                print('内容提交时回调 $text');
              },
              enabled: true, //是否禁用
              decoration: InputDecoration(//添加装饰效果
                  fillColor: Colors.grey.shade200,//添加灰色填充色
                  filled: true,
                  helperText: '用户名',
                  prefixIcon: Icon(Icons.person),//左侧图标
                  suffixText: '用户名'),//右侧文本提示
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable FloatingActionButton示例',
      home: DraggableFabPage(),
    );
  }
}

class DraggableFabPage extends StatefulWidget {
  @override
  _DraggableFabPageState createState() => _DraggableFabPageState();
}

class _DraggableFabPageState extends State<DraggableFabPage> {
  // 初始位置
  Offset position = Offset(50.0, 50.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable FloatingActionButton示例'),
      ),
      body: Stack(
        children: <Widget>[
          // 可拖动的组件
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              feedback: FloatingActionButton( // 反馈小部件
                child: Icon(Icons.add),
                backgroundColor: Colors.blue, onPressed: () {  },
              ),
              child: FloatingActionButton( // 小部件悬浮
                child: Icon(Icons.add),
                backgroundColor: Colors.blue, onPressed: () {  },
              ),
              childWhenDragging: Container(), // 拖动时的容器
              onDragEnd: (DraggableDetails details) { // يقوم بتحريك العنصر
                setState(() {
                  position = details.offset;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloatingActionButton示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton示例'),
        ),
        body: Center(
          child: Text(
            'FloatingActionButton示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: "请点击FloatingActionButton",
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("你点击了FloatingActionButton"),
              ),
            );
          },
          mini: false,
          shape: CircleBorder(),
          isExtended: false,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextButton组件示例'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'TextButton',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}


class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      home: Scaffold(
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
                  backgroundImage: AssetImage("assets/images/1.jpeg"),
                ),
                onDetailsPressed: () {},
                // 属性本来是用来设置当前用户的其他账号的头像 这里用来当QQ二维码图片展示
                otherAccountsPictures: <Widget>[
                  Container(
                    child: Image.asset('assets/images/code.jpeg'),
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
        body: Center(
          child: Text('Drawer示例'),
        ),
      ),
    );
  }
}

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

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
