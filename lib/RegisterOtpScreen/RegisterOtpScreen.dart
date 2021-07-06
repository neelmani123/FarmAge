import 'package:aov_farmage/RegisterPage/RegisterScreen.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
class RegisterOtpScreen extends StatefulWidget {
  final mobileno;
  const RegisterOtpScreen({this.mobileno,Key key}) : super(key: key);

  @override
  _RegisterOtpScreenState createState() => _RegisterOtpScreenState();
}

class _RegisterOtpScreenState extends State<RegisterOtpScreen> {
  TextEditingController mobile_controller=new TextEditingController();
  bool _isLoading;
  HttpServices _httpService = HttpServices();

  _send_otp(){
    String validate = validateMobile(mobile_controller.text);
    if (validate == null) {
      _otpVerify();

    }else{
      Fluttertoast.showToast(msg: validate);
    }
  }
  String validateMobile(String value) {
    String pattern = r'(^([9876]{1})([0-9]{9})$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
     setState(() {
       _isLoading=false;
       return 'Please enter mobile number';
     });
    } else if (!regExp.hasMatch(value)) {
      _isLoading=false;
      return 'Please enter valid mobile number';
    }
    return null;
  }
  _otpVerify()async{
    var res=await _httpService.user_otp_register(number: mobile_controller.text);
    if(res.status==true){
     setState(() {
       _isLoading=false;
       Fluttertoast.showToast(msg: res.message);
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>RegisterScreen(mobile: mobile_controller.text,)));
     });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    mobile_controller.text=widget.mobileno;
    super.initState();
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
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.only(left: 30,right: 30),
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
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  controller: mobile_controller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                      border: InputBorder.none,
                      hintText: 'Enter mobile number'
                  ),
                )
            ),
            SizedBox(height: 50,),
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
            SizedBox(height: 40,),
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
