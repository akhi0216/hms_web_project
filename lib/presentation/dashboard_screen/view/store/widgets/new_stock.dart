import 'package:flutter/material.dart';

class NewStock extends StatefulWidget {
  const NewStock({super.key});

  @override
  State<NewStock> createState() => _NewStockState();
}

class _NewStockState extends State<NewStock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("New stock")],
    );
  }
}