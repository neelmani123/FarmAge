import 'package:aov_farmage/HomePage/HomeScreen.dart';
import 'package:aov_farmage/LoginOtpScreen/LoginOtpScreen.dart';
import 'package:aov_farmage/RegisterOtpScreen/RegisterOtpScreen.dart';
import 'package:aov_farmage/RegisterPage/RegisterScreen.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading;
  HttpServices _httpService = HttpServices();
  TextEditingController mobile_controller=new TextEditingController();

  _send_otp(){
    String validate = validateMobile(mobile_controller.text);
    if (validate == null) {
      login_api();
    }else{
      Fluttertoast.showToast(msg: validate);
    }
  }
  Future<void> login_api()async{
    var res=await _httpService.user_login(number: mobile_controller.text);
    if(res.type=='login')
      {
       setState(() {
         _isLoading=false;
         Fluttertoast.showToast(msg: res.message);
         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>LoginOtpScreen(mobile: mobile_controller.text,)));
       });
      }
    else if(res.type=='regester')
      {
        setState(() {
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>RegisterOtpScreen(mobileno: mobile_controller.text,)));
        });
      }
  }

  String validateMobile(String value) {
    String pattern = r'(^([9876]{1})([0-9]{9})$)';
    _isLoading=false;
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      _isLoading=false;
      return 'Please enter valid mobile number';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Center(
                child: Image.asset('images/logo.png',width: 100,height: 100,),),
            SizedBox(height: 100,),
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
                    width: 2.0,
                  ),
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobile_controller,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
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
                  setState(() {
                    _send_otp();
                    _isLoading=true;
                  });
                  },
                  color: Colors.orangeAccent,
                  child:  _isLoading==true ?Container(height:20,width:20,child: CircularProgressIndicator(),):Text('VERIFY OTP',style: TextStyle(color: Colors.white,fontSize: 17),),),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("images/circcle.png",height:180)
              ],
            )
          ],
        ),
      ),
    );
  }
}
