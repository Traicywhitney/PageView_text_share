import 'package:flutter/material.dart';
import 'package:flutter_pageview_text_quotes/appdata_text.dart';

class DisplayText extends StatelessWidget {
  final AppDataText appDataText;
  const DisplayText({super.key, required this.appDataText});

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF7cbbc3),
                borderRadius: BorderRadius.circular(10),
              ),
        child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
          child: Text(
            appDataText.text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
      ),]
        ),
    ),
      ),
    ),
      ]  );
  }
}
