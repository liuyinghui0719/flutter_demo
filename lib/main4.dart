import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '滑动删除示例',
    home: MyApp(),
    debugShowMaterialGrid: true,
    showPerformanceOverlay: true,
  ));
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('自定义字体'),
      ),
      body: new Center(
        child: new Text(
          '你好 flutter',
          style: new TextStyle(fontFamily: 'myfont',fontSize: 36.0),
        ),
      ),
    );
  }
}

class MyApp11 extends StatelessWidget {
  //构建30条列表数据
  final List<String> items = List<String>.generate(30, (i) => "列表项 ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动删除示例'),
      ),
      //构建列表
      body: ListView.builder(
        itemCount: items.length, //指定列表长度
        itemBuilder: (context, index) {
          //提取出被删除的项
          final item = items[index];

          //返回一个可以被删除的列表项
          return Dismissible(
            key: Key(item),
            //被删除回调
            onDismissed: (direction) {
              //移除指定索引项
              items.removeAt(index);
              //底部弹出消息提示当前项被删除了
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$item 被删除了")),
              );
            },
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    //一定要把被触摸的组件放在GestureDetector里面
    return GestureDetector(
      onTap: () {
        //底部消息揭示
        final snackBar = SnackBar(content: Text("你已按下"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      //添加容器接收触摸动作
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme?.primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text('测试按钮'),
      ),
    );
  }
}

class MyApp10 extends StatelessWidget {
  const MyApp10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按下处理Demo'),
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }
}

class MyApp9 extends StatelessWidget {
  const MyApp9({super.key});

  @override
  Widget build(BuildContext context) {
    // 风景区地址部分
    Widget addressContainer = Container(
      padding: const EdgeInsets.all(32.0), // 此部分四周间隔一定距离
      // 水平布局
      child: Row(
        children: <Widget>[
          Expanded(
            // 垂直布局
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 次轴即水平方向左侧对齐
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0), // 与下面文本间隔一定距离
                  child: Text(
                    '风景区地址',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '湖北省十堰市丹江口市',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // 图标
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('66'),
        ],
      ),
    );

    // 构建按钮组中单个按钮 参数为图标及文本
    Column buildButtonColumn(IconData icon, String label) {
      // 垂直布局
      return Column(
        mainAxisSize: MainAxisSize.min, // 垂直方向大小最小化
        mainAxisAlignment: MainAxisAlignment.center, // 垂直方向居中对齐
        children: <Widget>[
          Icon(icon, color: Colors.lightGreen[600]), // 上面图标部分
          Container(
            // 距离上面图标一定间距
            margin: const EdgeInsets.only(top: 8.0),
            // 下面文本部分
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.lightGreen[600],
              ),
            ),
          )
        ],
      );
    }

    // 按钮组部分
    Widget buttonsContainer = Container(
      // 水平布局
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平方向均匀排列每个元素
        children: <Widget>[
          buildButtonColumn(Icons.call, '电话'),
          buildButtonColumn(Icons.near_me, '导航'),
          buildButtonColumn(Icons.share, '分享'),
        ],
      ),
    );

    // 风景区介绍文本部分
    Widget textContainer = Container(
      // 设置上下左右内边距
      padding: const EdgeInsets.all(32.0),
      // 文本块一定是用'''来引用起来
      child: Text(
        '''
        武当山，中国道教圣地，又名太和山、谢罗山、参上山、仙室山，古有“太岳”、“玄岳”、“大岳”之称。位于湖北西北部十堰市丹江口市境内。东接闻名古城襄阳市，西靠车城十堰市 ，南望原始森林神农架，北临高峡平湖 丹江口水库。
        明代，武当山被皇帝封为“大岳”、“治世玄岳”，被尊为“皇室家庙”。武当山以“四大名山皆拱揖，五方仙岳共朝宗”的“五岳之冠”地位闻名于世。
        1994年12月，武当山古建筑群入选《世界遗产名录》，2006年被整体列为“全国重点文物保护单位” 。2007年，武当山和长城、丽江、周庄等景区一起入选 “欧洲人最喜爱的中国十大景区”。2010至2013年，武当山分别被评为国家5A级旅游区、国家森林公园、中国十大避暑名山、海峡两岸交流基地，入选最美 “国家地质公园”。 
        截至2013年，武当山有古建筑53处，建筑面积2.7万平方米，建筑遗址9处，占地面积20多万平方米，全山保存各类文物5035件。 
        武当山是道教名山和武当武术的发源地，被称为“亘古无双胜境，天下第一仙山”。武当武术，是中华武术的重要流派。元末明初，道士张三丰集其大成，开创武当派。
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: '布局综合示例',
      // 自定义主题，主体颜色为绿色风格
      theme: ThemeData(
        brightness: Brightness.light, // 应用程序整体主题的亮度
        primaryColor: Colors.lightGreen[600], // App主要部分的背景色
      ),
      home: Scaffold(
        appBar: AppBar(
          // 页面标题
          title: Text(
            '武当山风景区',
            style: TextStyle(color: Colors.white),
          ),
        ),
        // 使用列表视图默认为垂直布局，并且子元素能够上下滚动
        body: ListView(
          children: <Widget>[
            // 风景图片
            Image.asset(
              './lib/images/wudang.jpeg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover, // 图片填充整个父容器
            ),
            addressContainer,
            buttonsContainer,
            textContainer,
          ],
        ),
      ),
    );
  }
}


class MyApp8 extends StatelessWidget {
  const MyApp8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap按宽高自动换行布局示例'),
      ),
      //自动换行布局组件
      body: Wrap(
        spacing: 8.0, // Chip之间的间距大小
        runSpacing: 4.0, // 行之间的间距大小
        children: <Widget>[
          Chip(
            //添加圆形头像
            avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800, child: Text('西门', style: TextStyle(fontSize: 10.0),)),
            label: Text('西门吹雪西门吹雪西门吹雪'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.lightBlue.shade700, child: Text('司空', style: TextStyle(fontSize: 10.0),)),
            label: Text('司空摘星'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.orange.shade800, child: Text('婉清', style: TextStyle(fontSize: 10.0),)),
            label: Text('木婉清'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue.shade900, child: Text('一郎', style: TextStyle(fontSize: 10.0),)),
            label: Text('萧十一郎'),
          ),
        ],
      ),
    );
  }
}

class MyApp7 extends StatelessWidget {
  const MyApp7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table布局示例'),
      ),
      //表格居中
      body: Center(
        //添加表格
        child: Table(
          //设置表格有多少列,并且指定列宽
          columnWidths: const <int, TableColumnWidth>{
            //指定索引及固定列宽
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(40.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(80.0),
          },
          //设置表格边框样式
          border: TableBorder.all(color: Colors.black38, width: 2.0, style: BorderStyle.solid),
          children: const <TableRow>[
            //添加第一行数据
            TableRow(
              children: <Widget>[
                Text('姓名'),
                Text('性别'),
                Text('年龄'),
                Text('身高'),
              ],
            ),
            //添加第二行数据
            TableRow(
              children: <Widget>[
                Text('张三'),
                Text('男'),
                Text('26'),
                Text('172'),
              ],
            ),
            //添加第三行数据
            TableRow(
              children: <Widget>[
                Text('李四'),
                Text('男'),
                Text('28'),
                Text('178'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp6 extends StatelessWidget {
  const MyApp6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('层叠定位布局示例'),
      ),
      body: Center(
        //添加层叠布局
        child: Stack(
          children: <Widget>[
            //添加网络图片
            Image.network(
                'http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960'),
            //设置定位布局
            Positioned(
                top: 0.0,
                left: 0.0,
                child: new Text(
                  'hi flutter',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MyApp5 extends StatelessWidget {
  const MyApp5({super.key});

  @override
  Widget build(BuildContext context) {

    var stack = Stack(
      //子组件左上角对齐
      alignment: Alignment.center,
      children: <Widget>[
        //底部添加一个头像
        CircleAvatar(
          backgroundImage: AssetImage('./lib/images/1.jpeg'),
          radius: 100.0,
        ),
        //上面加一个容器 容器里再放一个文本
        Container(
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
          child: Text(
            '我是超级飞侠',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack层叠布局示例'),
      ),
      body: Center(
        child: stack,
      ),
    );
  }
}

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    final appTitle = "Offstage控制是否显示组件示例";
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State to control whether the text widget is shown or hidden
  bool offstage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Offstage(
          offstage: offstage, // Controls whether to show the child widget
          child: Text(
            '我出来啦！',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle whether to show or hide the text widget
          setState(() {
            offstage = !offstage;
          });
        },
        tooltip: "显示隐藏",
        child: Icon(Icons.flip),
      ),
    );
  }
}


class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('长文本滚动布局示例'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text(
              '\n广州天河区公园',
              style: TextStyle(
                fontSize:30.0,
              ),
            ),
          ),
          Center(
            child: Text(
              '天河公园',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Center(
            //添加长文本
            child: Text(
              '''天河公园，是区属综合性公园，位于广州天河区员村，西靠天府路，南连黄埔大道，北接中山大道，来往交通十分便利。公园总面积为70.7公顷，水体面积占10公顷。天河公园以自然生态景观为主要特色，公园规划为五个功能区：百花园景区、文体娱乐区、老人活动区、森林休憩区、后勤管理区。
              ''',
              style: TextStyle(
                fontSize: 14.0,
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = IndexedStack(
      index: 1, // Setting index to 1 will show only the text content
      alignment: Alignment(0.2, 0.2),
      children: <Widget>[
        // Index 0
        CircleAvatar(
          backgroundImage: AssetImage('./lib/images/1.jpeg'), // Ensure the image path is correct
          radius: 100.0,
        ),
        // Index 1
        Container(
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
          child: Text(
            '我是超级飞侠',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('./lib/images/2.jpeg'), // Ensure the image path is correct
          radius: 100.0,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack层叠布局示例'),
      ),
      body: Center(
        child: stack,
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  // Function to build a list of Containers with images
  List<Widget> _buildGridTileList(int count) {
    return List.generate(count, (index) => Container(
      // Adjust image loading to handle AssetImage properly
      child: Image.asset(
        './lib/images/${(index % 9) + 1}.jpeg',
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    ));
  }

  // Function to build the GridView
  Widget buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 150.0, // Maximum width of each item
      padding: const EdgeInsets.all(4.0), // Padding around the grid
      mainAxisSpacing: 4.0, // Spacing between items along the main axis
      crossAxisSpacing: 4.0, // Spacing between items along the cross axis
      children: _buildGridTileList(16), // Number of items in the grid
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView九宫格示例'),
      ),
      body: Center(
        child: buildGrid(),
      ),
    );
  }
}


// void main() {
//   runApp(
//     MaterialApp(
//       title: 'AspectRatio调整宽高比',
//       home: LayoutDemo(),
//     ),
//   );
// }

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform矩阵转换示例'),
      ),
      body: Center(
        //父容器 作为背景
        child: Container(
          //背景颜色
          color: Colors.grey,
          //矩阵转换
          child: Transform(
            //对齐方式
            alignment: Alignment.topRight,
            //设置旋转值
            transform: Matrix4.rotationZ(0.8),
            //被旋转容器
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Transform矩阵转换'),
            ),
          ),
        ),
      ),
    );
  }
}


class LayoutDemo13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox设置具体尺寸示例'),
      ),
      body: SizedBox(
        //固定宽为200.0 高为300.0
        width: 1500.0,
        height: 300.0,
        child: const Card(
          child: Text('SizedBox',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}


class LayoutDemo12 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('水平布局示例'),
      ),
      //水平布局
      body: Row(
        children: <Widget>[
          Expanded(
            child: Text('左侧文本', textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text('中间文本', textAlign: TextAlign.center),
          ),
          //右侧图标
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutDemo11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding填充布局示例'),
      ),
      body: Center(
        //添加容器 外框
        child: Container(
          width: 1300.0,
          height: 300.0,
          //容器内边距上下左右设置为60.0
          padding: EdgeInsets.all(6.0),
          //添加边框
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.green,
              width: 118.0,
            ),
          ),
          //添加容器 内框
          child: Container(
            width: 200.0,
            height: 200.0,
            //添加边框
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 18.0,
              ),
            ),
            //添加图标
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class LayoutDemo10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OverflowBox溢出父容器显示示例'),
        ),
        body: Container(
          color: Colors.green,
          width: 200.0,
          height: 200.0,
          padding: const EdgeInsets.all(50.0),
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: 400.0,
            maxHeight: 400.0,
            child: Container(
              color: Colors.blueGrey,
              width: 300.0,
              height: 300.0,
            ),
          ),
        ));
  }
}

class LayoutDemo9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizedBox百分比布局示例'),
      ),
      body: Container(
        color: Colors.blueGrey,
        height: 200.0,
        width: 200.0,
        child: FractionallySizedBox(
          alignment: Alignment.topLeft,//元素左上角对齐
          widthFactor: 0.5,//宽度因子
          heightFactor: 1.5,//高度因子
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class LayoutDemo8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox缩放布局示例'),
      ),
      //外部容器
      body: Container(
        color: Colors.grey,
        width: 250.0,
        height: 250.0,
        //缩放布局
        child: FittedBox(
          //宽高等比填充
          fit: BoxFit.fitWidth,
          //对齐属性 左上角对齐
          alignment: Alignment.topLeft,
          //内部容器
          child: Container(
            color: Colors.deepOrange,
            child: Text("缩放布局"),
          ),
        ),
      ),
    );
  }
}

class LayoutDemo7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //返回一个Container对象
    Widget container = Container(
      //添加装饰效果
      decoration: BoxDecoration(
        //背景色
        color: Colors.grey,
      ),
      //子元素指定为一个垂直水平嵌套布局的组件
      child: Column(
        children: <Widget>[
          //水平布局
          Row(
            children: <Widget>[
              //使用Expanded防止内容溢出
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  //添加边框样式
                  decoration: BoxDecoration(
                    //上下左右边框设置为宽度10.0 颜色为蓝灰色
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    //上下左右边框弧度设置为8.0
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  //上下左右增加边距
                  //添加图片
                  child: Image.asset('./lib/images/1.jpeg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('./lib/images/2.jpeg'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('./lib/images/3.jpeg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  child: Image.asset('./lib/images/4.jpeg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Container容器布局示例'),
      ),
      body: container,
    );
  }
}

class LayoutDemo6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox限定宽高示例'),
      ),
      //添加容器
      body: ConstrainedBox(
        //设置限定值
        constraints: const BoxConstraints(
          minWidth: 150.0,
          minHeight: 150.0,
          maxWidth: 220.0,
          maxHeight: 220.0,
        ),
        //子容器
        child: Container(
          width: 100.0,
          height: 500.0,
          color: Colors.green,
        ),
      ),
    );
  }
}


class LayoutDemo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垂直布局示例二'),
      ),
      //文本按垂直方向排列
      body: Column(
        //水平方向靠左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Flutter是谷歌的移动UI框架'),
          Text('可以快速在iOS和Android上构建高质量的原生用户界面'),
          Text('Flutter可以与现有的代码一起工作。在全世界'),
          Text('Flutter正在被越来越多的开发者和组织使用'),
          Text('并且Flutter是完全免费、开源的。'),
          Text('Flutter!', style: TextStyle(fontSize: 36.0,)),//放大字号
        ],
      ),
    );

  }
}


class LayoutDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垂直布局示例一'),
      ),
      //垂直布局
      body: Column(
        children: <Widget>[
          Text('Flutter'),
          Text('垂直布局'),
          //添加图标
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );

  }
}

class LayoutDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center居中布局示例'),
      ),
      //居中组件 位于body的中心位置
      body: Center(
        //添加文本
        child: Text(
          'Hello Flutter',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}

class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Baseline基准线布局示例'),
        ),
        body: Container(
          color: Colors.blueGrey, // 背景色
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Baseline(
                baseline: 30.0,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'AaBbCc',
                  style: TextStyle(
                    fontSize: 18.0,
                    textBaseline: TextBaseline.alphabetic,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              Baseline(
                baseline: 0.0,
                baselineType: TextBaseline.alphabetic,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  color: Colors.green,
                ),
              ),
              Baseline(
                baseline: 0.0,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'DdEeFf',
                  style: TextStyle(
                    fontSize: 26.0,
                    textBaseline: TextBaseline.alphabetic,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class LayoutDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio调整宽高比示例'),
      ),
      body: Container(
        width: 200.0,
        child: AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
