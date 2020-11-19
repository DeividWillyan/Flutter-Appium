import 'package:appium_example/widgets/custom_text_example.dart';
import 'package:appium_example/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: Column(
            children: [
              CustomTextExample(
                onTap: () => setState(() => count++),
              ),
              Text(
                '$count',
                style: TextStyle(fontSize: 32),
                key: Key('count-key'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
