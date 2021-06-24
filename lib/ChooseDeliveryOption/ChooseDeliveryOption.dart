import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChooseDeliveryOption extends StatefulWidget {
  const ChooseDeliveryOption({Key key}) : super(key: key);

  @override
  _ChooseDeliveryOptionState createState() => _ChooseDeliveryOptionState();
}

class _ChooseDeliveryOptionState extends State<ChooseDeliveryOption> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      Text('Choose Delivery Option',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Text('Delivery Details',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 50,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.location_on,color: Colors.orangeAccent,size: 17,),
                    Text('467/7,Main Market,Laxmi Nagar,200231',style: TextStyle(color: Colors.grey),),
                    Text('change address')
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Container(
                    width:MediaQuery.of(context).size.width/4,
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,color: Colors.orangeAccent,size: 17,),
                        Text('16/03/2020')
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width:MediaQuery.of(context).size.width/4,
                    height: 50,
                    child: Row(
                      children: [
                        Text(' Today-90min')
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width:MediaQuery.of(context).size.width/4,
                    height: 50,
                    child: Row(
                      children: [
                        Icon(Icons.watch_later,color: Colors.orangeAccent,size: 17,),
                        Text('16/03/2020')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Text('Order List',style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text('2 Items')
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
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
                                Text('No of Pieces:20',style: TextStyle(color: Colors.grey),),
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
                              Text('200',style: TextStyle(color: Colors.grey),),
                              Spacer(),
                              Container(
                                width:30,
                                height: 30,
                                //margin: EdgeInsets.only(left:10,right: 15),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.grey,
                                  child: Text('-',style: TextStyle(color: Colors.black,fontSize: 20),),),
                              ),
                              Container(
                                width:30,
                                height: 30,
                                //padding: EdgeInsets.only(left: 10,right: 10),
                                // margin: EdgeInsets.only(left:10,right: 15),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.orangeAccent,
                                  child: Text('1',style: TextStyle(color: Colors.white,fontSize: 20),),),
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
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Container(
                          height: 200,
                          child: Image.asset('images/banner.png')),
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
                                Text('No of Pieces:20',style: TextStyle(color: Colors.grey),),
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
                              Text('200',style: TextStyle(color: Colors.grey),),
                              Spacer(),
                              Container(
                                width:30,
                                height: 30,
                                //margin: EdgeInsets.only(left:10,right: 15),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.grey,
                                  child: Text('-',style: TextStyle(color: Colors.black,fontSize: 20),),),
                              ),
                              Container(
                                width:30,
                                height: 30,
                                //padding: EdgeInsets.only(left: 10,right: 10),
                                // margin: EdgeInsets.only(left:10,right: 15),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),),
                                  onPressed: (){
                                  },
                                  color: Colors.orangeAccent,
                                  child: Text('1',style: TextStyle(color: Colors.white,fontSize: 20),),),
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Promo Code',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10,right: 10),
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: Row(
                  children: [
                    Text(
                      'hhjjhjj',style: TextStyle(color: Colors.grey,),
                    ),
                    Spacer(),
                    Text('APPLY',style: TextStyle(color: Colors.red),)
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(

                   children: [
                     Radio(
                       activeColor: Colors.orangeAccent,

                     ),
                     Text('Payment On Delivery'),
                   ],
                 ),
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.orangeAccent,
                      ),
                      Text('Cash On Delivery'),
                    ],
                  )

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
                    child: Text('Place Order',style: TextStyle(color: Colors.white,fontSize: 17),),),
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
