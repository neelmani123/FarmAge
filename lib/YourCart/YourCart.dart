import 'package:aov_farmage/ChangeAddress/ChnageAddress.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:aov_farmage/model/YourCartList/YourCartLIstData.dart';
import 'package:fluttertoast/fluttertoast.dart';
class YourCart extends StatefulWidget {
  const YourCart({Key key}) : super(key: key);

  @override
  _YourCartState createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  bool _isLoading=true;
  List<Data>data=[];
  HttpServices _httpService = HttpServices();
  Future<void>my_cart()async{
    var res=await _httpService.my_cart();
    if(res.status==true)
      {
        setState(() {
          data=res.data;
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
          print("Data is:${data}");
        });
      }
  }
  Future<void>remove_cart(String productId,String variantId)async{
    var res=await _httpService.cart_remove(productId: productId,variantId: variantId);
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          my_cart();
          _isLoading=false;
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    my_cart();
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
                      Text('Your Cart',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ListView.builder(
                itemCount: data.length,
                  itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Container(
                          height: 200,
                          child: Image.network('${data[index].productImage??''}',fit: BoxFit.cover,)),
                      // trailing: Icon(Icons.cancel_outlined,size: 12,),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text('${data[index].productName??''}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                Spacer(),
                                InkWell(
                                  onTap: ()
                                  {
                                    setState(() {
                                      _isLoading=true;
                                      remove_cart(data[index].productID, data[index].variantID);
                                    });

                                  },
                                    child: Icon(Icons.clear,size: 15,color: Colors.grey,))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text('No of Pieces:${data[index].qty??''}',style: TextStyle(color: Colors.grey),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Text('Serves:4',style: TextStyle(color: Colors.grey),),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text('Gross Wt:467gms',style: TextStyle(color: Colors.grey),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text('Net wt:500gms',style: TextStyle(color: Colors.grey),),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Icon(Icons.link,size: 17,color: Colors.grey,),
                              Text('${data[index].mrp??''}',style: TextStyle(color: Colors.grey),),
                              Spacer(),
                              Container(
                                width:30,
                                height: 30,
                                margin: EdgeInsets.only(right: 5),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text('-',style: TextStyle(color: Colors.black,fontSize: 20),),
                                  ),),
                              ),
                              Container(
                                width:30,
                                height: 30,
                                //padding: EdgeInsets.only(left: 10,right: 10),
                                 margin: EdgeInsets.only(right: 5),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.orangeAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text('1',style: TextStyle(color: Colors.white,fontSize: 20),),
                                  ),),
                              ),
                              Container(
                                width:30,
                                height: 30,
                                //padding: EdgeInsets.only(left: 10,right: 10),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.grey,
                                  child: Text('+',style: TextStyle(color: Colors.black,fontSize: 20),),),
                              ),
                              SizedBox(height: 10,)

                            ],
                          )
                        ],
                      ),
                    ),
                  );
                  })
            ),
            SizedBox(height: 20,),
             Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:60,
                    child: Divider(
                      thickness: 2,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Text('Yay !You have unlocked exclusive offers! '),
                  Container(
                    width: 60,
                      child: Divider(
                        thickness: 2,
                        color: Colors.orangeAccent,)),
                ],
              ),
            ),
            Container(
              height: 220,
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
                            padding: const EdgeInsets.only(left: 10,top: 5),
                            child: Row(
                              children: [
                                Text('Lamb kebabs',style: TextStyle(fontWeight: FontWeight.bold),),
                                //Spacer(),
                                Container(
                                  width:30,
                                  height: 30,
                                  margin: EdgeInsets.only(left:130,right: 15),
                                  //padding: EdgeInsets.only(left: 50),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),),
                                    onPressed: (){
                                    },
                                    color: Colors.grey,
                                    child: Text('+',style: TextStyle(color: Colors.black,fontSize: 20),),),
                                ),

                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text('No of Pieces:1',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Text('Gross Wt:467gms',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
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
                                Container(
                                  width:150,
                                  height: 20,
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  margin: EdgeInsets.only(left: 60,),
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
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40,top: 10),
                      child: Text('PAYMENT DETAILS',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('SUBTOTAL'),
                          Spacer(),
                          Text('1990',style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('1 MONTH PLAN'),
                          Spacer(),
                          Text('99',style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('DELIVERY CHARGE'),
                          Spacer(),
                          Text('0',style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0,left: 8),
                      child: Row(
                        children: [
                          Text('FREE DELIVERY',style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0,left: 8,right: 8),
                      child: Divider(
                        thickness: 2,
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Total'),
                          Spacer(),
                          Text('1100',style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Row(
                  children: [
                    Text('Shipping Address'),
                    Spacer(),
                    Container(
                      width:180,
                      height: 40,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      margin: EdgeInsets.only(left: 60,),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ChangeAddress()));
                        },
                        color: Colors.orangeAccent,
                        child: Row(
                          children: [
                            Icon(Icons.add,color: Colors.white,),
                            Text('Add Address',style: TextStyle(color: Colors.white,fontSize: 17),),
                          ],
                        ),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
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
                    child: Row(
                      children: [
                        Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 17),),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,),
                      ],
                    ),),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
