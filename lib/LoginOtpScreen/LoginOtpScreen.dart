import 'package:aov_farmage/HomePage/HomeScreen.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginOtpScreen extends StatefulWidget {
  final mobile;
  const LoginOtpScreen({this.mobile,Key key}) : super(key: key);

  @override
  _LoginOtpScreenState createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {
  bool _isLoading;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HttpServices _httpService = HttpServices();
  TextEditingController otp_controller=new TextEditingController();
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      setState(() {
        _otpVerify();
        _isLoading=true;
      });
    } else {
      print('Form is invalid');
    }
  }
  _otpVerify()async{
    var res=await _httpService.user_otp_login(number: widget.mobile,otp: otp_controller.text);
    if(res.status==true)
      {
        setState(() async{
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('name', res.data.name);
          prefs.setString('email', res.data.email);
          prefs.setString('token', res.data.jwtToken);
          prefs.setString('number', res.data.phone);
          prefs.setString('id', res.data.id);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    enabled: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: '${widget.mobile}'
                    ),
                  )
              ),
             // SizedBox(height: 10,),
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
                    validator: (value){
                      if(value.length!=4)
                        {
                          return "Enter 4 digit otp";
                        }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    controller: otp_controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: 'Enter otp'
                    ),
                  )
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width:150,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),),
                    onPressed: (){
                     setState(() {
                      validateAndSave();
                     });
                    },
                    color: Colors.orangeAccent,
                    child:  _isLoading==true ?Container(height:20,width:20,child: CircularProgressIndicator(),):Text('Save',style: TextStyle(color: Colors.white,fontSize: 17),),),
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
      ),
    );
  }
}
