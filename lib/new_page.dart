import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          print(_controller.value);
          print(_controller.text);
        },
        child: Icon(Icons.search),
      ),
      appBar: AppBar(title: const Text("Snap Gallery")),
      body: Align(
        alignment: AlignmentGeometry.topRight,
        child: SizedBox(
          width: 200,
          height: double.infinity,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '聊聊新鲜事',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            cursorOpacityAnimates: true,
            cursorRadius: Radius.circular(2),
            cursorWidth: 2,
            cursorColor: Colors.black,
            maxLines: null,
          ),
        ),
      ),
    );
  }
}
