import 'package:flutter/material.dart';
import 'package:flutter_pageview_text_quotes/appdata_text.dart';
import 'package:flutter_pageview_text_quotes/display_text.dart';
import 'package:share_plus/share_plus.dart';


class PageViewText extends StatefulWidget {
  const PageViewText({super.key});

  @override
  State<PageViewText> createState() => _PageViewTextState();
}

class _PageViewTextState extends State<PageViewText> {
  var _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7cbbc3),
        title: Text(
          'George Carlin Quotes',
          style: TextStyle( fontWeight: FontWeight.bold,fontSize: 25),
        ),
        actions: [
          PopupMenuButton<int>(itemBuilder: (context) =>
          [
            PopupMenuItem(value: 1, child: Text("share")),
          ],
            onSelected: (value) {
              if (value == 1) {
                _shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 300,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _selectedPage = index;
                        });
                      },
                      controller: PageController(viewportFraction: 0.7),
                      itemCount: appDataTextList.length,
                      itemBuilder: (context, index) {
                        var _quotes = appDataTextList[index];
                        var _scale = _selectedPage == index ? 1.0 : 0.8;
                        return
                          TweenAnimationBuilder(
                              duration: Duration(microseconds: 300),
                              tween: Tween(begin: _scale, end: _scale),
                              child: DisplayText(
                                  appDataText: _quotes),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: child,
                                );
                              }
                          );
                      }
                  )
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    (_selectedPage + 1).toString() + '/' +
                        appDataTextList.length.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            )

          ]
      ),
    );
  }

  _shareInfo() {
    print('------->share');

    Share.share(appDataTextList[_selectedPage].text);

    print(appDataTextList[_selectedPage].text);
  }
}