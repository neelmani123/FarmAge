import 'package:aov_farmage/HomePage/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Center(
                child: Image.asset('images/logo.png',width: 100,height: 100,),),
            SizedBox(height: 120,),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text('Enter Your Mobile Number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 3.0,
                  ),
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                      border: InputBorder.none,
                      hintText: 'Enter Your Phone Number'
                  ),
                )
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width:150,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
                  },
                  color: Colors.orangeAccent,
                  child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 17),),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
