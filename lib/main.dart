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

class _MyAppState extends State<MyApp> {
  ///int double bool String List
  ///bool false true
  ///操作一个列表
  ///列表的名字[下标] --- 取列表里的值
  ///列表的名字.length   ---计算列表的长度
  final List<String> friendNames = ['张三', '李四', '王五'];
  final List<String> avatarUrls = [
    'https://picsum.photos/300/400?random=1',
    'https://picsum.photos/300/400?random=2',
    'https://picsum.photos/300/400?random=3',
  ];
  final List<double> redPacketHistory = [5.20, 13.14, 66.66];

  final Map<String, String> names = {'name': '张三', 'age': '18', 'sex': '男'};
  final List<Map<String, String>> namess = [
    {'name': '张三', 'age': '18', 'sex': '男'},
    {'name': '张三', 'age': '18', 'sex': '男'},
    {'name': '张三', 'age': '18', 'sex': '男'}
  ];



  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: friendNames.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewPage(friendNames[index]);
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                color: Colors.redAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(friendNames[index]),
                    Text(avatarUrls[index]),
                    Text('${redPacketHistory[index]}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
