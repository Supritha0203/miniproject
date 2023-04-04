import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Miscellaneous extends StatelessWidget {
  const Miscellaneous({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('This is a page to show redirection'),
        ElevatedButton(onPressed: Navigator.of(context).pop, child: Text("Simon Go Back!!"))
      ],)
    );
  }
}