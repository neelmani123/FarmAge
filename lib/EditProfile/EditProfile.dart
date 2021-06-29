import 'dart:convert';
import 'dart:io';

import 'package:aov_farmage/EditProfile/profileModelData.dart';
import 'package:aov_farmage/ThankYou/ThankYou.dart';
import 'package:aov_farmage/ThankYou1/ThankYou1.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _isLoading=true;
  HttpServices _httpService = HttpServices();
  Data data;
  final ImagePicker _picker = ImagePicker();
  String imageUrl="";
  PickedFile _imageFiler;
  TextEditingController name_controller=new TextEditingController();
  TextEditingController gender_controller=new TextEditingController();
  //Here get Image from Camera and Gallery
  void getImage1(source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFiler = pickedFile;
      print("Pic Name:${File(_imageFiler.path)}");
    });
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "Choose Profile photo",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(Icons.camera, color: Colors.green),
                onPressed: () {
                  getImage1(ImageSource.camera);
                  Navigator.pop(context);
                },
                label: Text(
                  "Camera",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.image, color: Colors.green),
                onPressed: () {
                  getImage1(ImageSource.gallery);
                  Navigator.pop(context);

                },
                label: Text("Gallery",style: TextStyle(color: Colors.black),),
              ),
            ],
          )
        ],
      ),
    );
  }


  Future getProfileData()async{
    var res= await _httpService.getProfile();
    if(res.status==true)
      {
       setState(() {
         _isLoading=false;
         Fluttertoast.showToast(msg:res.message);
         data=res.data;
       });
      }
  }
  Future _uploadImage()async
  {
    _isLoading=true;
    final _prefs = await SharedPreferences.getInstance();
    String fileName1 = _imageFiler.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "jwtToken": _prefs.getString('token'),
        "profile_img":await  MultipartFile.fromFile(
            _imageFiler.path,filename: fileName1),
        "name":name_controller.text,
        "gender":gender_controller.text,
      });
      Response response = await Dio().post(
          "https://devclub.co.in/aov_farmage/admin/api/Users_api/profile_update",
          data: formData);
      print("File Upload Response $response");
      setState(() {
        Fluttertoast.showToast(msg: "Update  Successfully.");
        _isLoading=false;
       // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou1()));
      });
      Map<String,dynamic> data=jsonDecode(response.data);
      var sms=data['message'];
      print("Result is:${sms}");
    } catch (e) {
      print("Exception caught $e");
    }
  }
  @override
  void initState() {
    getProfileData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                      Text('Edit Profile',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 50,left: 20),
                child: CircleAvatar(
                  radius: 52,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFiler==null?NetworkImage("${data.image??''}"):
                    FileImage(File(_imageFiler.path)),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Positioned(
                  // right: 100,
                  left: 10,
                  bottom: 20,
                  child: InkWell(
                    onTap: (){
                      showModalBottomSheet(
                                context: context,
                                builder: (builder) => bottomSheet());
                    },
                    child: Container(
                      child: Icon(Icons.edit,color: Colors.black,),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  controller: name_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                      border: InputBorder.none,
                      hintText: '${data.name}'
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: Text('Email id',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                      border: InputBorder.none,
                      hintText: '${data.email}'
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: Text('Gender',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                  controller: gender_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.phone_android,color: Colors.black,),
                      border: InputBorder.none,
                      hintText: '${data.gender}'
                  ),
                )
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
                       setState(() {
                         _uploadImage();
                         _isLoading=true;
                       });
                    },
                    color: Colors.orangeAccent,
                    child: Text('Update',style: TextStyle(color: Colors.white,fontSize: 17),),),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou()));
                    },
                    color: Colors.orangeAccent,
                    child: Text('Change Password',style: TextStyle(color: Colors.white,fontSize: 17),),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
