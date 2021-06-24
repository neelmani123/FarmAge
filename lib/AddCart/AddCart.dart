import 'package:flutter/material.dart';
class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Container(
              height: 150,
              child: Center(
                child: Icon(Icons.shopping_cart,size: 100,color: Colors.grey,),
              ),
            ),
            Center(
              child: Text('YOUR CART IS EMPTY',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
