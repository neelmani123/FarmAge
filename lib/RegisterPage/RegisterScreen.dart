import 'package:aov_farmage/HomePage/HomeScreen.dart';
import 'package:aov_farmage/LoginPage/LoginScreen.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterScreen extends StatefulWidget {
  final mobile;
  const RegisterScreen({this.mobile,Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name_controller=new TextEditingController();
  TextEditingController email_controller=new TextEditingController();
  TextEditingController phone_controller=new TextEditingController();
  TextEditingController gender_controller=new TextEditingController();
  HttpServices _httpService = HttpServices();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
     setState(() {
       _registerApi();
       _isLoading=true;
     });
    } else {
      print('Form is invalid');
    }
  }
  _registerApi()async{
    var res=await _httpService.user_register_api(name: name_controller.text,email: email_controller.text,phone: phone_controller.text,gender: gender_controller.text);
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
  void initState() {
    // TODO: implement initState
    phone_controller.text=widget.mobile;
    super.initState();
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
              SizedBox(height: 50,),
              Center(
                child: Image.asset('images/logo.png',width: 100,height: 100,),),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(height: 30,),
              Container(
                  margin: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    validator: (value)=>value.isEmpty?'Enter Name':null,
                    keyboardType: TextInputType.text,
                   controller: name_controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: 'Name'
                    ),
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    validator: (value){
                      if(!emailRegex.hasMatch(value)){
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                   controller: email_controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: 'Email'
                    ),
                  )
              ),
              SizedBox(height: 20,),
              Container(
                height: 60,
                  margin: EdgeInsets.only(left: 30,right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    validator: (value){
                      if(value.length!=10)
                        {
                          return 'Enter Valid mobile number';
                        }
                      return null;
                    },
                   controller: phone_controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: 'Phone'
                    ),
                  )
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (_) {
                        int selectedRadio;
                        return AlertDialog(
                          title: Text(
                            'Select Gender', textAlign: TextAlign.center,style: TextStyle( fontFamily: 'RobotoSlab',),),
                          content: StatefulBuilder(
                              builder: (BuildContext context,StateSetter setState)
                              {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Radio(value: 0,
                                                  groupValue: selectedRadio,
                                                  onChanged: (val) {
                                                    gender_controller.text = "Male";
                                                    setState(() => selectedRadio = val,
                                                    );
                                                  }),
                                              Text("Male", style: TextStyle(fontFamily: 'RobotoSlab'),),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Radio(value: 1,
                                                  groupValue: selectedRadio,
                                                  onChanged: (val) {
                                                    gender_controller.text = "Female";
                                                    setState(() => selectedRadio = val);
                                                  }),
                                              Text("Female", style: TextStyle(fontFamily: 'RobotoSlab'),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                              child: Text("Cancel", style: TextStyle(fontFamily: 'RobotoSlab'),),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                              child: Text("OK", style: TextStyle(fontFamily: 'RobotoSlab'),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                          ),
                        );
                      }
                  );
                },
                child: Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    child:IgnorePointer(
                child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 47),
                          child: Text('Gender'),
                        ),
                       // Spacer(),
                        /*Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(Icons.arrow_drop_down,size: 30,),
                        )*/
                      ],
                    ),
                    TextFormField(
                      controller: gender_controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person_outline,color: Colors.black,)
                      ),
                    ),
                  ],
                ),
              ),
        ),
                ),
              ),
              // SizedBox(height: 10,),
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
                    child:  _isLoading==true ?Container(height:20,width:20,child: CircularProgressIndicator(),):Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 17),),),
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
