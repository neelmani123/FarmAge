import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key key}) : super(key: key);

  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios,color: Colors.white,),
                      Text('Change Address',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
              minHeight: 30,
              maxHeight: 200,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              panelBuilder: (sc) => _panel(sc),
            )
          ],
        ),
      ),

    );
  }
  Widget _panel(ScrollController sc){
    return MediaQuery.removePadding(context: context,
        child: ListView(
          controller:  sc,
          children: [
            Text('Search for Area/Locality'),
            Container(
                height: 40,
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.orangeAccent,),
                      border: InputBorder.none,
                      hintText: 'What are you Craving for?',
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                )
            ),
          ],
        ));
  }
}


