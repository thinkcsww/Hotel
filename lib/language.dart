import 'package:flutter/material.dart';
import 'localization.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage>  {
  SharedPreferences prefs;
  String locale = "";
  void getLocale() async{
    prefs = await SharedPreferences.getInstance();
    locale = prefs.getString("locale");
  }
  String title = "select Language";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),body: ListView(
          children: <Widget>[
            Center(
              child: ListTile(
                title: Text('English', textAlign: TextAlign.center,),
                onTap: () {
                    setState(() {
                      title = DemoLocalizations.of(context).trans('eng');
                    });
                },
              ),
            ),
            Center(
              child: ListTile(
                title: Text('한국어', textAlign: TextAlign.center,),
                onTap: () {
                    setState(() {
                      title = DemoLocalizations.of(context).trans('kor');
                    });
                },
              ),
            ),
         ],
        ),

    );
  }
}
