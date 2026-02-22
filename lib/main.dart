import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> friendNames = ['张三', '李四', '王五'];
  final List<String> avatarUrls = [
    'https://picsum.photos/300/400?random=1',
    'https://picsum.photos/300/400?random=2',
    'https://picsum.photos/300/400?random=3',
  ];
  final List<double> redPacketHistory = [5.20, 13.14, 66.66];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: friendNames.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              color: Colors.redAccent,
              child: Text(friendNames[index]),
            );
          },
        ),
      ),
    );
  }
}
