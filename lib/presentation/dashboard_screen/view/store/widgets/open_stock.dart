import 'package:flutter/material.dart';

class OpenStock extends StatefulWidget {
  const OpenStock({super.key});

  @override
  State<OpenStock> createState() => _OpenStockState();
}

class _OpenStockState extends State<OpenStock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Open stock")],
    );
  }
}