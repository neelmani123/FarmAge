import 'package:aov_farmage/EditProfile/EditProfile.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:aov_farmage/Slider/PageSlider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aov_farmage/EditProfile/profileModelData.dart';
class MyAccount extends StatefulWidget {
  const MyAccount({Key key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool _isLoading=true;
  Data data;
  HttpServices _httpService = HttpServices();
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
      body:  _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):SingleChildScrollView(
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
                      Text('My Account',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
           Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10,left: 20),
                  child: CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("${data.image??''}"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Positioned(
                    // right: 100,
                    left: 10,
                    bottom: 20,
                    child: InkWell(
                      onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfile()));
                      },
                      child: Container(
                        child: Icon(Icons.edit,color: Colors.grey,),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('${data.name??''}',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('${data.email??''}',style: TextStyle(color: Colors.grey),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: Text('${data.phone}',style: TextStyle(color: Colors.grey),),
                    ),
                  ],
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Complete your profile to earn a reward'),
                            Spacer(),
                            Text('10%Done',style: TextStyle(color: Colors.orangeAccent),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('BASIC INFORMATION'),

                          Text('PERSONAL INFORMATION',style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              child: Divider(thickness: 2,color: Colors.orangeAccent,),
                            width: MediaQuery.of(context).size.width/2.2,
                          ),
                          Container(
                            child: Divider(thickness: 2,color: Colors.orangeAccent,),
                            width: MediaQuery.of(context).size.width/2.2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/logo.png'),
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('UNLIMITED FREE DELIVERY !',style: TextStyle(fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('Starting at just 200',style: TextStyle(color: Colors.grey),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),),
                                onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
                                },
                                color: Colors.orangeAccent,
                                child: Text('JOIN NOW',style: TextStyle(color: Colors.white,fontSize: 12),),),
                            ],
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag,color: Colors.grey,size: 20,),
                      Text('MY ORDERS'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,size: 15,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Divider(thickness: 1,color: Colors.grey,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag,color: Colors.grey,size: 20,),
                      Text('MY ORDERS'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,size: 15,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Divider(thickness: 1,color: Colors.grey,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag,color: Colors.grey,size: 20,),
                      Text('MY ORDERS'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,size: 15,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Divider(thickness: 1,color: Colors.grey,),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PageSlider()));
                    },
                    color: Colors.orangeAccent,
                    child: Row(
                      children: [
                        Icon(Icons.logout,color: Colors.orangeAccent,size: 20,),
                        Text('Logout',style: TextStyle(color: Colors.white,fontSize: 17),),
                      ],
                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
