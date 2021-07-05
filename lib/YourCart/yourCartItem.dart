import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:aov_farmage/model/YourCartList/YourCartLIstData.dart';
import 'package:fluttertoast/fluttertoast.dart';
class YourCartItem extends StatefulWidget {
  const YourCartItem({Key key}) : super(key: key);

  @override
  _YourCartItemState createState() => _YourCartItemState();
}

class _YourCartItemState extends State<YourCartItem> {
  bool _isLoading=true;
  List<Data1>data=[];
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
    return Container(
      height: 200,
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
          }),
    );
  }
}
