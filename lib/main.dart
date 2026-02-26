import 'package:flutter/material.dart';
import 'package:teaching_use_1/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

///判断式
///if(条件){条件为真时要做的事情}else{条件为假时做的事情}
///三目运算符
///条件 ? 条件为真时返回的值 : 条件为假时返回的值
///交互的核心->状态管理->state
///黑色：没有被点击 -》 false
///红色：被点击    ——》 true
///color:isClicked ? Colors.red : Colors.black;
///final bool isClicked = false;///在一开始是没有被点击过
///当用户点击了这个爱心，我们就要把isClicked改为true
///命名规范：在state中的变量，我们一般都加上_，表示这个变量是私有的

class _MyAppState extends State<MyApp> {
  ///定义一个变量，表示这个组件是否被点击过
  bool _isClicked = false;

  ///final 表示的是这个变量，在一开始就定义好了，之后不可以被更改
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              setState(() {
                _isClicked = !_isClicked;
              });
            },
            child: Text(_isClicked ? "测试真" : "测试假"),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SigalMessage(index);
            },
          ),
        ),
      ),
    );
  }

  Widget SigalMessage(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(40),
          child: Container(
            width: 80,
            height: 80,
            child: Image.network(
              'https://picsum.photos/300/400?random=$index',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ryan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "friend",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 168, 168, 168),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Hello,It's my first app！",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewPage(),
                          ),
                        );
                      },
                      child: Hero(
                        tag: index,
                        child: Image.network(
                          'https://picsum.photos/300/400?random=$index',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '评论',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isClicked = !_isClicked;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: _isClicked ? Colors.red : Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(height: 2, color: Colors.blueGrey),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
