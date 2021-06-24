import 'package:flutter/material.dart';
class OrderStatus extends StatefulWidget {
  const OrderStatus({Key key}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      Text('Order Status',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.watch_later,size: 100,color: Colors.orangeAccent,),
                  Text('Your Order is cancelled\nSuccessfully !!',style: TextStyle(fontSize: 30,color: Colors.grey),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Row(
                children: [
                  Icon(Icons.location_on,size: 17,color: Colors.orangeAccent,),
                  Text('Home Address'),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),),
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
                          },
                          color: Colors.grey,
                          child: Text('CANCEL ORDER',style: TextStyle(color: Colors.black),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text('928 Lehner Juction Apt.047'),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: ListView(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Container(
                          height: 200,
                          child: Image.asset('images/banner.png')),
                      // trailing: Icon(Icons.cancel_outlined,size: 12,),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('Boneless Cubes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text('Order Placed:',style: TextStyle(color: Colors.grey),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Fri,19 Feb 2021',style: TextStyle(color: Colors.grey),),
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
                              Text('Shipment ID:hih2746',style: TextStyle(color: Colors.grey),),
                              Spacer(),
                              Text('420.0'),
                              SizedBox(height: 10,)

                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
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
          ],
        ),),
    );
  }
}
