import 'package:flutter/material.dart';
import 'package:aov_farmage/model/MyOrderLIst/OrderListData.dart';
class MyOrderDetails extends StatefulWidget {
  final List<Data>data;
  const MyOrderDetails({this.data,Key key}) : super(key: key);

  @override
  _MyOrderDetailsState createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(child: Text('My Order Details')),),
    );
  }
}
