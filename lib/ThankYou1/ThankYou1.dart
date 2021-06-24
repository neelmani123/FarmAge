import 'package:flutter/material.dart';
class ThankYou1 extends StatefulWidget {
  const ThankYou1({Key key}) : super(key: key);

  @override
  _ThankYou1State createState() => _ThankYou1State();
}

class _ThankYou1State extends State<ThankYou1> {
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
                      Text('Order Summary',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Image.asset('images/banner.png'),
                  ),
                ),
                Text('THANK YOU',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,letterSpacing: 2),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Order Successfully Placed',style: TextStyle(letterSpacing: 1,color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Date And Time',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,letterSpacing: 1),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Friday,April 16,2020',style: TextStyle(letterSpacing: 1,color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Payment Method',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,letterSpacing: 1),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Cash on Delivery',style: TextStyle(letterSpacing: 1,color: Colors.grey),),
                ),

              ],
            ),
            SizedBox(height: 50,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou1()));
                    },
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Icon(Icons.directions_bike,size: 17,),
                        Text('Track Your Order',style: TextStyle(color: Colors.black,fontSize: 17),),
                      ],
                    ),),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou()));
                    },
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Icon(Icons.directions_bike,size: 17,),
                        Text('Cancel Order',style: TextStyle(color: Colors.black,fontSize: 17),),
                      ],
                    ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
