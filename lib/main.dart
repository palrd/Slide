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
  final String nickName = 'Flutter女神';
  final int messageCount = 99;
  final double money = 88.88;
  final bool isVip = true;
  final Color themeColors = Colors.green;
  final List<String> friendNames = ['张三', '李四', '王五'];
  final List<String> avatarUrls = [
    'https://picsum.photos/300/400?random=1',
    'https://picsum.photos/300/400?random=2',
    'https://picsum.photos/300/400?random=3',
  ];
  final List<double> redPacketHistory = [5.20, 13.14, 66.66];
  final int age = 8;
  final String bio = "大家好，我是flutter";

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
