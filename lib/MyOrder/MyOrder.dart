import 'package:aov_farmage/MyOrder/MyOrderDetails.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:aov_farmage/model/MyOrderLIst/OrderListData.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aov_farmage/MyOrder/MyOrderDetails.dart';
class MyOrder extends StatefulWidget {
  const MyOrder({Key key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List<Data>details=[];
  bool _isLoading=true;
  HttpServices _httpServices=new HttpServices();
  Future<void>my_orderList()async{
    var res=await _httpServices.my_order_list();
    if(res.status==true)
      {
        setState(() {
          details=res.data;
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
        });

      }
  }
  @override
  void initState() {
    // TODO: implement initState
    my_orderList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(child: Text('My Order'),),),
      body:_isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):ListView.builder(
        itemCount: details.length,
          itemBuilder: (context,index)
          {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${details[index].deliveryDate??''}')
                    ],
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_bag,size: 12,color: Colors.orangeAccent,),
                        Text("Order ID:"),
                        Text('${details[index].orderID??''}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,size: 12,color: Colors.orangeAccent,),
                        Text("Address:"),
                        Text('${details[index].landmark??''}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,size: 12,color: Colors.orangeAccent,),
                        Text("Price:"),
                        Text('${details[index].totalAmount??''}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(Icons.location_on,size: 12,color: Colors.orangeAccent,),
                        Text("Status:"),
                        Text('${details[index].landmark??''}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyOrderDetails(data: details,)));
                        },
                        child: Container(
                          height: 30,
                          padding: EdgeInsets.only(left: 10,top: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                                color: Colors.black),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          width: 100,
                          child: Text('VIEW DETAIL',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 10,top: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        width: 100,
                        child: Text('Track order',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            );

      })
    );
  }
}
