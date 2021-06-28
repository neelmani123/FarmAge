import 'package:aov_farmage/EditProfile/profileModelData.dart';
import 'package:aov_farmage/ThankYou/ThankYou.dart';
import 'package:aov_farmage/ThankYou1/ThankYou1.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _isLoading=true;
  HttpServices _httpService = HttpServices();
  Data data;

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
                    backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg"),
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
                      /*showModalBottomSheet(
                                context: context,
                                builder: (builder) => bottomSheet());*/
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
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ThankYou1()));
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
