import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teaching_use_1/add_page.dart';
import 'package:teaching_use_1/person_page.dart';

void main() {
  runApp(const MyApp());
}

class Theme {
  static const TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "校园墙@xyq",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: ShowTip()),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return MessageCard(index);
                    },
                  ),
                ],
              ),
              Positioned(left: 0, right: 0, bottom: 30, child: BottomNav()),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTip extends StatelessWidget {
  const ShowTip({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddPage();
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          children: [
            Person(1),
            SizedBox(width: 10),
            SizedBox(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("paladepa_palrd", style: Theme.title),
                  Text("分享新鲜事儿", style: Theme.subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Person extends StatelessWidget {
  final int index;
  const Person(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.network(
          'https://picsum.photos/300/400?random=$index',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MessageCard extends StatefulWidget {
  final int index;
  const MessageCard(this.index, {super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 20),

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Person(widget.index),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("flutter_qq", style: Theme.title),
                          SizedBox(width: 20),
                          Text("7小时", style: Theme.subtitle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！这是测试文本！",
                        style: Theme.title,
                        maxLines: 50,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              itemCount: 9,
              padding: EdgeInsets.only(left: 60),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    clipBehavior: Clip.hardEdge,
                    constraints: BoxConstraints(minHeight: 200, minWidth: 150),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(129, 158, 158, 158),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(144, 158, 158, 158),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Image.network(
                      'https://picsum.photos/300/400?random=$index',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            padding: EdgeInsets.only(left: 60, right: 10, bottom: 20),
            child: Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, size: 20, color: Colors.black),
                    SizedBox(width: 3),
                    Text('3K', style: Theme.subtitle),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.message, size: 20, color: Colors.black),
                    SizedBox(width: 3),
                    Text('16', style: Theme.subtitle),
                  ],
                ),
                SizedBox(width: 20),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.telegram_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(width: 3),
                    Text('3K', style: Theme.subtitle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool _isHome = true;
  bool _isPerson = false;
  bool _isAdd = false;
  @override
  void initState() {
    _isHome = true;
    _isPerson = false;
    _isAdd = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentGeometry.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(143, 255, 255, 255),
              border: Border(bottom: BorderSide(width: 1, color: Colors.white)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Container(
                    width: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _isHome
                          ? const Color.fromARGB(97, 68, 137, 255)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: _isHome ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _isAdd
                          ? const Color.fromARGB(97, 68, 137, 255)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: _isAdd ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ),

                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PersonPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: _isPerson
                          ? const Color.fromARGB(97, 68, 137, 255)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: _isPerson ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
