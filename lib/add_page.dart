import 'package:flutter/material.dart';

class Theme {
  static const TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle titleWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );
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

class InputContent extends StatelessWidget {
  const InputContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Person(1),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("paladepa_palrd", style: Theme.title),
                        SizedBox(width: 3),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 3),
                        Expanded(
                          child: Transform.translate(
                            offset: Offset(0, -1),
                            child: TextField(
                              style: Theme.title,
                              maxLines: 1,
                              cursorOpacityAnimates: true,
                              cursorColor: Colors.black,
                              cursorRadius: Radius.circular(2),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "添加主题",
                                hintStyle: Theme.subtitle,
                                contentPadding: EdgeInsets.zero,
                                isCollapsed: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 500),
                      child: TextField(
                        style: Theme.title,
                        maxLines: null,
                        cursorOpacityAnimates: true,
                        cursorColor: Colors.black,
                        cursorRadius: Radius.circular(2),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "分享新鲜事儿",
                          hintStyle: Theme.subtitle,
                          contentPadding: EdgeInsets.zero,
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('点击右边的发布按钮发送你的推文！->', style: Theme.subtitle),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Text("发布", style: Theme.titleWhite),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "发布推文",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
      ),
      body: SafeArea(child: InputContent()),
    );
  }
}
