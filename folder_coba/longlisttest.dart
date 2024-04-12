import 'package:flutter/material.dart';

class LongListTest extends StatefulWidget {
  const LongListTest({super.key});

  @override
  State<LongListTest> createState() => _LongListTestState();
}

class _LongListTestState extends State<LongListTest> {
  final List<String> _items = ['item 1', 'item 2'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        prototypeItem: ListTile(
          title: Text(_items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
          );
        });
  }
}
