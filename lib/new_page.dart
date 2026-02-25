import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final Map<String, String> songInfo;
  const NewPage(this.songInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(songInfo["songName"]!)),
      body: ListTile(
        leading: Image.network(songInfo["image"]!, fit: BoxFit.cover),
        title: Text(songInfo["singer"]!),
        subtitle: Text(songInfo["songName"]!),
        trailing: Text(songInfo["comment"]!),
      ),
    );
  }
}
