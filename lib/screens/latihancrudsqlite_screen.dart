import 'package:flutter/material.dart';

class LatihanCRUDSQlite extends StatefulWidget {
  const LatihanCRUDSQlite({super.key});

  @override
  State<LatihanCRUDSQlite> createState() => _LatihanCRUDSQliteState();
}

class _LatihanCRUDSQliteState extends State<LatihanCRUDSQlite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan CRUD SQlite'),
      ),
    );
  }
}