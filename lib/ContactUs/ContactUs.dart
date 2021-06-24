import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text('Contact Us',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Icon(Icons.account_balance_wallet,size: 50,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0,top: 50),
              child: Text('CONTACT INFO',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 10),
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.orangeAccent,),
                  Text('J-18 Sector 18 Noida,Uttar Pradesh,201301')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 10),
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.orangeAccent,),
                  Text('Support@aovfarmage.com')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 10),
              child: Row(
                children: [
                  Icon(Icons.mobile_screen_share,color: Colors.orangeAccent,),
                  Text('+91-9650833800')
                ],
              ),
            ),
            SizedBox(height: 250,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Container(
                 margin: EdgeInsets.only(left: 10),
                 width: 80,
                 height: 80,
                 child: CircleAvatar(
                   child:Icon(Icons.account_balance,),
                 ),
               ),
                Container(
                  margin: EdgeInsets.only(left: 30,right: 20,top: 10),
                  width: 100,
                  height: 100,
                  child: Image.asset('images/banner.png'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
