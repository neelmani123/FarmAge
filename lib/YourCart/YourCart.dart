import 'package:aov_farmage/AddressList/AddressList.dart';
import 'package:aov_farmage/ChangeAddress/ChnageAddress.dart';
import 'package:aov_farmage/ChooseDeliveryOption/ChooseDeliveryOption.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:aov_farmage/model/YourCartList/YourCartLIstData.dart';
import 'package:fluttertoast/fluttertoast.dart';
class YourCart extends StatefulWidget {
  final addressId;
  const YourCart({this.addressId,Key key}) : super(key: key);
  @override
  _YourCartState createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  bool _isLoading=true;
  List<Data1>data=[];
  bool visibilityTag = false;
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
          visibilityTag=true;
          _isLoading=false;
        });
      }
  }
  Future<void>addToCart(String productID,String variantId)async{
    var res=await _httpService.add_to_cart(productId: productID,variantId: variantId);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        my_cart();
       _isLoading=false;
      });
    }
  }
  Future<void>subToCart(String productID,String variantId)async{
    var res=await _httpService.sub_to_cart(productId: productID,variantId: variantId);
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          my_cart();
          _isLoading=false;
        });
      }
    else if(res.status==false)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          _isLoading=false;
          Navigator.pop(context);
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
              height: 380,
              child: ListView.builder(
                itemCount: data.length,
                  itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Image.network('${data[index].productImage??''}',height: 200,),
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
                                Text('Gross Wt:${data[index].unitValue}',style: TextStyle(color: Colors.grey),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text('Net wt:${data[index].unit}',style: TextStyle(color: Colors.grey),),
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
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _isLoading=true;
                                    subToCart(data[index].productID,data[index].variantID);
                                  });
                                },
                                child: Container(
                                  width:25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey
                                  ),
                                  //margin: EdgeInsets.only(left:130,right: 15),
                                  padding: EdgeInsets.only(left: 8),
                                  child:Text('-',style: TextStyle(color: Colors.black,fontSize: 20),),
                                ),
                              ),
                              Container(
                                width:25,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orangeAccent
                                ),
                                //margin: EdgeInsets.only(left:130,right: 15),
                                padding: EdgeInsets.only(left: 7,top: 5),
                                child:Text('${data[index].qty}',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _isLoading=true;
                                    addToCart(data[index].productID,data[index].variantID);
                                  });
                                },
                                child: Container(
                                  width:25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey
                                  ),
                                  //margin: EdgeInsets.only(left:130,right: 15),
                                  padding: EdgeInsets.only(left: 7),
                                  child:Text('+',style: TextStyle(color: Colors.black,fontSize: 20),),
                                ),
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
                                  width:25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey
                                  ),
                                  margin: EdgeInsets.only(left:130,right: 15),
                                  padding: EdgeInsets.only(left: 7),
                                  child:Text('+',style: TextStyle(color: Colors.black,fontSize: 20),),
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
                                  width:120,
                                  height: 25,
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  margin: EdgeInsets.only(left: 90,),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),),
                                    onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
                                    },
                                    color: Colors.orangeAccent,
                                    child: Text('Add To Card',style: TextStyle(color: Colors.white,fontSize: 12),),),
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
                child: DottedBorder(
                  color: Colors.grey,
                  strokeWidth: 2,
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
                      width:165,
                      height: 40,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      margin: EdgeInsets.only(left: 60,),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddressList()));
                        },
                        color: Colors.orangeAccent,
                        child: Row(
                          children: [
                            Icon(Icons.add,color: Colors.white,),
                            Text('Add Address',style: TextStyle(color: Colors.white,fontSize: 15),),
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
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ChooseDeliveryOption(addressid: widget.addressId,)));
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
