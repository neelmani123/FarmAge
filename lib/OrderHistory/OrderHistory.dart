import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class OrderHistory extends StatefulWidget {
  const OrderHistory({Key key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.orangeAccent,
        title: Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: 4,
          itemBuilder: (context,index){
        return Container(
          height: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
             border: Border.all(
               color: Colors.grey,
               width: 1
             )
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Image.asset('images/banner.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Text('Premium Chicken curry cut',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5),
                        child: Row(
                          children: [
                            Text('Order placed:Fri,19 Feb 2021',style: TextStyle(color: Colors.grey),),
                            Padding(padding: EdgeInsets.only(left: 5),
                              child: Text('Rate',style: TextStyle(color: Colors.grey),),)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: Text('08:30PM'),
                          ),
                          //Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 100,top: 10),
                            child: Text('420.00'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: Text('450gms',style: TextStyle(color: Colors.grey),),
                          ),
                          //Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 100,top: 10),
                            child: Text('Qty:1',style: TextStyle(color: Colors.grey),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: Text('Shipment ID:hjvg',style: TextStyle(color: Colors.grey),),
                          ),
                          //Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 40,top: 10),
                            child: Text('Completed',style: TextStyle(color: Colors.grey),),
                          )
                        ],
                      ),
                     // Divider(thickness: 2,)


                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      border: Border.all(color: Colors.grey,width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('VIEW DETAILS',style: TextStyle(color: Colors.grey),),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.grey,width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('NOTIFY ME',style: TextStyle(color: Colors.grey),),
                    ),
                  ),

                  Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.grey,width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('REPEAT ORDER',style: TextStyle(color: Colors.red),),
                    ),
                  ),
                ],
              ),
            ],
          )
        );

      }),
    );
  }
}
