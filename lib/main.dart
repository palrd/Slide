import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Theme {
  static const TextStyle titleBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle titleStyle = TextStyle(
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
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "校园墙@xyq",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: ShowTip(),
              ),
            ),
            SliverToBoxAdapter(child: MessageCard()),
          ],
        ),
      ),
    );
  }
}

class HeadPortrait extends StatefulWidget {
  const HeadPortrait({super.key});

  @override
  State<HeadPortrait> createState() => _HeadPortraitState();
}

class _HeadPortraitState extends State<HeadPortrait> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.network(
          'https://picsum.photos/300/400?random=1',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ShowTip extends StatefulWidget {
  const ShowTip({super.key});

  @override
  State<ShowTip> createState() => _ShowTipState();
}

class _ShowTipState extends State<ShowTip> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeadPortrait(),
        SizedBox(width: 10),
        SizedBox(
          height: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('paladepa_palrd', style: Theme.titleStyle),
              Text('分享新鲜事', style: Theme.subtitle),
            ],
          ),
        ),
      ],
    );
  }
}

class MessageCard extends StatefulWidget {
  const MessageCard({super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadPortrait(),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('xinn.1777', style: Theme.titleStyle),
                          SizedBox(width: 20),
                          Text('7小时', style: Theme.subtitle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '这将是我测试的文本内容！',
                        style: Theme.titleBold,
                        maxLines: 50,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 60),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  height: 200,
                  margin: EdgeInsets.only(right: 8),
                  clipBehavior: Clip.hardEdge,
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
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.network(
                    'https://picsum.photos/300/400?random=$index',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
