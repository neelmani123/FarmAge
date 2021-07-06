import 'package:aov_farmage/AddCart/AddCart.dart';
import 'package:aov_farmage/AddressList/AddressList.dart';
import 'package:aov_farmage/ChooseDeliveryOption/ChooseDeliveryOption.dart';
import 'package:aov_farmage/ContactUs/ContactUs.dart';
import 'package:aov_farmage/EditProfile/EditProfile.dart';
import 'package:aov_farmage/CategoryDetails/Mutton.dart';
import 'package:aov_farmage/OrderHistory/OrderHistory.dart';
import 'package:aov_farmage/OrderStatus/OrderStatus.dart';
import 'package:aov_farmage/OurBlog/OurBlog.dart';
import 'package:aov_farmage/PaymentMethod/PaymentMethod.dart';
import 'package:aov_farmage/ReferAFriend/ReferAFriend.dart';
import 'package:aov_farmage/Wallet/Wallet.dart';
import 'package:aov_farmage/YourCart/YourCart.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:aov_farmage/model/CategoryListModel/CategoryListData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aov_farmage/MyAccount/MyAccount.dart';
import 'package:aov_farmage/MyOrder/MyOrder.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading=true;
  HttpServices _httpService = HttpServices();
  List<Data>data=[];
  Future<void>category_list_api()async{
    var res=await _httpService.category_list_api();
    if(res.status==true)
      {
        setState(() {
          data=res.data;
          _isLoading=false;
          print(data);
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    category_list_api();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                  /*child: CircleAvatar(
                    child: FlutterLogo(),
                  )*/
                child: Image.asset('images/logo.png',width: 40,height: 40,),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,color: Colors.orangeAccent,),
              title: Text('Home',),
              onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Wallet()));
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home,color: Colors.orangeAccent,),
              title: Text('My Order',),
              onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Wallet()));
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyOrder()));
              },
            ),
            Divider(),
            ListTile(
              /*subtitle: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle_outlined),
                      Text('MY PROFILE')
                    ],
                  )
                ],
              ),*/
              leading: Icon(Icons.person_outline_sharp,color: Colors.orangeAccent,),
              title: Text('MY ACCOUNT',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditProfile()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline_sharp,color: Colors.orangeAccent,),
              title: Text('PRODUCTS',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OurBlog()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline_sharp,color: Colors.orangeAccent,),
              title: Text('TRACK ALL ORDER',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ReferAFriend()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock,color: Colors.orangeAccent,),
              title: Text('PRIVACY',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PaymentMethod()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone,color: Colors.orangeAccent,),
              title: Text('CONTACT US',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ContactUs()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.folder,color: Colors.orangeAccent,),
              title: Text('GALLERY',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OrderStatus()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline_sharp,color: Colors.orangeAccent,),
              title: Text('TERMS & CONDITION',),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.orangeAccent,),
              title: Text('LOGOUT',),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OrderHistory()));
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        child:   Column(
          children: [
            SizedBox(height: 20,),
            Image.asset('images/logo.png',width: 50,height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               IconButton(
                 icon: Icon(Icons.menu),
                 onPressed: ()=>scaffoldKey.currentState.openDrawer(),
               ),
                Padding(
                  padding: const EdgeInsets.only(left: 145),
                  child: Icon(Icons.location_on,color: Colors.orangeAccent,),
                ),
               /* Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text('Current Location'),
                ),*/
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyAccount()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_circle_outlined,color: Colors.orangeAccent,),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddCard()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart,color: Colors.orangeAccent,),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 40,
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.orangeAccent,),
                      border: InputBorder.none,
                      hintText: 'What are you Craving for?',
                      hintStyle: TextStyle(color: Colors.grey)
                  ),
                )
            ),
          ],
        ),
      ),
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.orangeAccent,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                itemCount: data.length,
                  itemBuilder: (context,index){
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        width:80,
                        height: 85,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(data[index].image??''),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('${data[index].title??''}',style: TextStyle(fontSize: 12),),
                            )
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Mutton(cat_id: data[index].categoryID,)));
                      },
                    ),
                  ],
                );
              })
            ),
            Container(
              margin: EdgeInsets.only(top: 10,left: 10,right: 10),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/banner.png'),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Text('BESTSELLER',style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,),),
                  Spacer(),
                  Text('SEE ALL',style: TextStyle(color: Colors.black,fontSize: 12),),
                  Icon(Icons.arrow_forward_ios,size: 12,)
                ],
              ),
            ),
           Container(
             height: 250,
             width: MediaQuery.of(context).size.width,
             child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: 7,
                 itemBuilder: (context,index){
                   return  Card(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 100,
                           width: 270,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                 fit: BoxFit.cover,
                                   image: AssetImage('images/banner.png')
                               )
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 50,top: 5),
                           child: Text('Lamb kebabs',style: TextStyle(fontWeight: FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                           child: Text('Make your kebab look perfect!\nThe shoulder being the tastiest \npart of'),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text('Pieces:1',style:TextStyle(fontWeight: FontWeight.bold),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 20),
                                 child: Text('Gross:1',style: TextStyle(fontWeight: FontWeight.bold),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 30),
                                 child: Text('Net:1',style: TextStyle(fontWeight: FontWeight.bold),),
                               ),
                             ],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 10,left: 5),
                           child: Row(
                             children: [
                               Icon(Icons.money,size: 20,),
                               Text('200'),
                               Padding(
                                 padding: EdgeInsets.only(left: 10),
                                 child: Text('MRP:240',style: TextStyle(color: Colors.grey),),
                               ),
                               Container(
                                 width:130,
                                 height: 20,
                                 padding: EdgeInsets.only(left: 10,right: 10),
                                 margin: EdgeInsets.only(left: 20),
                                 child: RaisedButton(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(20)),),
                                   onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>YourCart()));
                                   },
                                   color: Colors.orangeAccent,
                                   child: Text('Add To Card',style: TextStyle(color: Colors.white,fontSize: 14),),),
                               ),
                             ],
                           ),
                         )
                       ],
                     ),
                   );
                 }),
           ),
            Container(
              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Row(
                children: [
                  Text('EXPLORE BY CATEGORY',style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('SEE ALL',style: TextStyle(color: Colors.black,fontSize: 12),),
                  Icon(Icons.arrow_forward_ios,size: 12,)
                ],
              ),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                shrinkWrap: false,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context,index){
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network('https://devclub.co.in/aov_farmage/admin/uploads/category/image1624704795.jpg',width: 100,),
                            SizedBox(height: 10,),
                            Text('CHICKEN',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
                          ],
                        ),
                      )
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Text('TRADING NOW',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,letterSpacing: 1),),
                ],
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context,index){
                    return  Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 270,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/banner.png')
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50,top: 5),
                            child: Text('Lamb kebabs',style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                            child: Text('Make your kebab look perfect!\nThe shoulder being the tastiest \npart of'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text('Pieces:1',style:TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('Gross:1',style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text('Net:1',style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 5),
                            child: Row(
                              children: [
                                Icon(Icons.money,size: 20,),
                                Text('200'),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('MRP:240',style: TextStyle(color: Colors.grey),),
                                ),
                                Container(
                                  width:150,
                                  height: 20,
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),),
                                    onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
                                    },
                                    color: Colors.orangeAccent,
                                    child: Text('Add To Card',style: TextStyle(color: Colors.white,fontSize: 17),),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Row(
                children: [
                  Text('INSTAGRAM POST',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,letterSpacing: 1),),
                ],
              ),
            ),
            Container(

              height: 210,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context,index){
                    return  Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/banner.png')
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                            child: Text('Make your kebab look perfect!\nThe shoulder being the tastiest \npart of'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text('Rohu Small'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Icon(Icons.camera_alt),
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Row(
                children: [
                  Text('OUR BLOGS',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,letterSpacing: 1),),
                ],
              ),
            ),
            Container(
              height:150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context,index){
                    return  Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.redAccent)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(

                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/banner.png')
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Text('Making The Perfect Biryani',style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
