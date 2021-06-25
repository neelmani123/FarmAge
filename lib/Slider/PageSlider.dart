import 'package:flutter/material.dart';
//import 'package:page_slider/page_slider.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({Key key}) : super(key: key);

  @override
  _PageSliderState createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
 // GlobalKey<PageSliderState> _slider = GlobalKey();

  Widget _card(String text) =>
      Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              )
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
           /* PageSlider(
              key:  _slider,
              pages: <Widget>[
                _card('First Page'),
                _card('Second Page'),
                _card('Third Page'),
                _card('Fourth Page'),
              ],
            ),*/
           /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
                  onPressed: () => _slider.currentState.previous(),
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  onPressed: () => _slider.currentState.next(),
                ),
              ],
            ),*/
          ],
        ),

      ),
    );
  }
}
