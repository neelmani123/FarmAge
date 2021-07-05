import 'package:aov_farmage/ChangeAddress/ChnageAddress.dart';
import 'package:aov_farmage/ChooseDeliveryOption/ChooseDeliveryOption.dart';
import 'package:aov_farmage/YourCart/YourCart.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aov_farmage/model/AddressList/AddressListData.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  bool _isLoading=true;
  List<Data>details=[];
  int _value2 = 1;
  String _selectedIndex = "";
  HttpServices _httpServices=new HttpServices();
  Future<void>getAddress()async{
    var res=await _httpServices.address_list();
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          details=res.data;
          _isLoading=false;
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    getAddress();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _isLoading
            ? Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
            : SafeArea(
          child: Column(
            children: [
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
                        Text('Add Address',style: TextStyle(color: Colors.white),),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) => ChangeAddress()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        child: Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              margin: EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(details[i].contactPersonName),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(details[i].contactPersonMobile),
                                        Text(details[i].addressType),
                                        Text(details[i].landmark),
                                        Text(details[i].pincode),
                                      ],
                                    ),
                                    Spacer(),
                                    Radio(
                                        value: i,
                                        activeColor: Colors.deepOrange,
                                        groupValue: _value2,
                                        onChanged: (int value) {
                                          setState(() {
                                            _value2 = value;
                                            _selectedIndex=details[i].addressID;
                                            print(
                                                "Radio index is ${_selectedIndex}");
                                          });
                                        })
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                YourCart(addressId: _selectedIndex,)));
                  });
                  // Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  padding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: _isLoading == true
                      ? Container(
                      height: 30,
                      width: 20,
                      child: CircularProgressIndicator())
                      : Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
