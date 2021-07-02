import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:aov_farmage/model/Slots/SlotsData.dart';
class ChooseDeliveryOption extends StatefulWidget {
  const ChooseDeliveryOption({Key key}) : super(key: key);

  @override
  _ChooseDeliveryOptionState createState() => _ChooseDeliveryOptionState();
}

class _ChooseDeliveryOptionState extends State<ChooseDeliveryOption> {
  DateTime _date = DateTime.now();
  bool _isLoading=true;
  bool loading=true;
  String _formatteddate="";
  List<Data>data1=[];
  int selectedRadio;
  String choice;
  HttpServices _httpServices=new HttpServices();
  Future<void>slots_list()async{
    var res=await _httpServices.slots_list();
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          data1=res.data;
          _isLoading=false;
          print("Duration is:${res.data}");
        });
      }
  }
  Future<Null> selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      print('SelectedRadio Is:${selectedRadio}');
      payment_mode(selectedRadio);

    });
  }
  Future payment_mode(int selected)
  {

    switch(selected)
    {
      case 1:
        choice="Payment on Delivery";
        print(choice);
        break;
      case 2:
        choice="Cash on Delivery";
        print(choice);
        break;
      default:
        choice = null;
    }
  }
  Future<void>order(String slot)async{
    var res=await _httpServices.order(date: _formatteddate,slot: slot,address_id: "1",payment_mode: choice);
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          loading=false;
        });
      }
    else if(res.status==false)
      {
        Fluttertoast.showToast(msg: res.message);
        loading=false;
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    slots_list();
    selectedRadio = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _formatteddate = new DateFormat.yMMMd().format(_date);
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
                InkWell(
                  onTap: (){
                    setState(() {
                      selectDate(context);
                      print(_formatteddate);
                    });
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      width:MediaQuery.of(context).size.width/3.5,
                      height: 40,
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,color: Colors.orangeAccent,size: 17,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("${_formatteddate}",),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    width:MediaQuery.of(context).size.width/3.5,
                    height: 40,
                    child: Row(
                      children: [
                        Text('Today-${data1[0].duration}')
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    width:MediaQuery.of(context).size.width/3.5,
                    height: 40,
                    child: Row(
                      children: [
                        Icon(Icons.watch_later,color: Colors.orangeAccent,size: 17,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('07:00'),
                        )
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
                          child: Image.asset('images/banner.png',)),
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
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      width:200,
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
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
                 InkWell(
                   onTap: (){
                     setState(() {
                       selectedRadio = 1;
                     });
                   },
                   child: Row(
                     children: [
                       Radio(
                         activeColor: Colors.orangeAccent,
                         value: 1,
                         groupValue: selectedRadio,
                           onChanged: (val) {
                             setSelectedRadio(val);
                           }
                       ),
                       Text('Payment On Delivery'),
                     ],
                   ),
                 ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedRadio = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                            groupValue: selectedRadio,
                            onChanged: (val) {
                              setSelectedRadio(val);
                            }
                        ),
                        Text('Cash On Delivery'),
                      ],
                    ),
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
                     setState(() {
                       loading=true;
                       order(data1[0].slotID);
                     });
                    },
                    color: Colors.orangeAccent,
                    child: loading==true?Container(width:50,height:50,child: CircularProgressIndicator(),):Text('Place Order',style: TextStyle(color: Colors.white,fontSize: 17),),),
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
