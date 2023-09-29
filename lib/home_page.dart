import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inputText = '';
  var controller = TextEditingController();
  var box = Hive.box('names');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            Text(inputText),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                setState(() {
                  inputText = controller.text;
                });
              },
              child: Text('Read'),
            ),
            ElevatedButton(
              onPressed: () {
                box.put(1, 'Ali');
              },
              child: Text('Create'),
            ),
            ElevatedButton(
              onPressed: () {
                var text = box.get(1);
                print(text);
              },
              child: Text('read'),
            ),
            ElevatedButton(
              onPressed: () {
                box.put(1, 'tashakkori');
              },
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: () {
                box.delete(1);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
