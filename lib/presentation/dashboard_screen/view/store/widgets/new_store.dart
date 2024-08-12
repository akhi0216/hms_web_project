import 'package:flutter/material.dart';

class NewStore extends StatefulWidget {
  const NewStore({super.key});

  @override
  State<NewStore> createState() => _NewStoreState();
}

class _NewStoreState extends State<NewStore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("New store")],
    );
  }
}