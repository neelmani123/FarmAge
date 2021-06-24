import 'package:flutter/material.dart';
class ReferAFriend extends StatefulWidget {
  const ReferAFriend({Key key}) : super(key: key);

  @override
  _ReferAFriendState createState() => _ReferAFriendState();
}

class _ReferAFriendState extends State<ReferAFriend> {
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
                      Text('Refer A Feiend',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Icon(Icons.person,size: 50,),
            ),
            SizedBox(height: 20,),
            Center(
              child:  Text('INVITE YOUR FRIENDS & GET CASH BACK\nOFFERS ON AOV FARMAGE',style: TextStyle(letterSpacing: 2),),
            ),
            SizedBox(height: 50,),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                borderRadius: BorderRadius.circular(5)
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Code:WARE2CBM',style: TextStyle(color: Colors.grey,fontSize: 20),),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child:  Text('Dont Forgot to apply it at Checkout',style: TextStyle(letterSpacing: 1,color: Colors.grey),),
            ),
            SizedBox(height: 50,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),),
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou1()));
                    },
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Icon(Icons.share,size: 17,),
                        Text('Whatsapp',style: TextStyle(color: Colors.black,fontSize: 17),),
                      ],
                    ),),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),),
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou()));
                    },
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Icon(Icons.share,size: 17,),
                        Text('  More  ',style: TextStyle(color: Colors.black,fontSize: 17),),
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
