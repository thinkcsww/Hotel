import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),body: ListView(
          children: <Widget>[
            Center(
              child: ListTile(
                title: Text('English', textAlign: TextAlign.center,),
                onTap: () {

                },
              ),
            ),
            Center(
              child: ListTile(
                title: Text('한국어', textAlign: TextAlign.center,),
                onTap: () {

                },
              ),
            ),
         ],
        ),

    );
  }
}
