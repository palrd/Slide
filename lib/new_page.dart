import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String songName;
  final String singer;
  final String comment;
  const NewPage(this.songName, this.singer, this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [Text(songName), Text(singer), Text(comment)]),
      ),
    );
  }
}
