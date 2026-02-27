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

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "我的主页",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
      ),
      body: SafeArea(child: ShowContent()),
    );
  }
}

class Person extends StatelessWidget {
  final int index;
  const Person(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(35),
        child: SizedBox(
          width: 70,
          height: 70,
          child: Image.network(
            'https://picsum.photos/300/400?random=$index',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ShowContent extends StatefulWidget {
  const ShowContent({super.key});

  @override
  State<ShowContent> createState() => _ShowContentState();
}

class _ShowContentState extends State<ShowContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '帕拉德帕',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('paladepa_palrd', style: Theme.title),
                ],
              ),
              Person(1),
            ],
          ),
          SizedBox(height: 10),
          Text('我将成为Flutter大师！', style: Theme.title),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  alignment: AlignmentGeometry.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('编辑主页', style: Theme.title),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  alignment: AlignmentGeometry.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('分享主页', style: Theme.title),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentGeometry.center,
              child: Text('你还没有发布推文哦', style: Theme.subtitle),
            ),
          ),
        ],
      ),
    );
  }
}
