import 'package:appium_example/pages/two_page.dart';
import 'package:appium_example/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Spacer(),
            Icon(
              Icons.person,
              size: 100,
              color: Colors.purple[800],
            ),
            CustomTextFormFieldWidget(
              key: Key('input-user'),
              hintText: 'User',
            ),
            CustomTextFormFieldWidget(
              key: Key('input-password'),
              hintText: 'Password',
              obscureText: true,
            ),
            Spacer(flex: 3),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                key: Key('btn-login'),
                color: Colors.purple[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TwoPage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
