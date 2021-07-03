import 'package:aov_farmage/ChangeAddress/ChnageAddress.dart';
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
      /*decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Assets/Images/background.png"),
              fit: BoxFit.cover)),*/
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
          title: Text('Select Address'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ChangeAddress()));
                }),
          ],
        ),
        /*body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlacePicker(
                        apiKey: apiKey,
                        initialPosition: kInitialPosition,
                        useCurrentLocation: true,
                        selectInitialPosition: true,

                        //usePlaceDetailSearch: true,
                        onPlacePicked: (result) {
                          selectedPlace = result;
                          Navigator.of(context).pop();
                          setState(() {});
                          print(selectedPlace.formattedAddress);

                        },

                      );
                    },
                  ),
                );

              },
              child: Container(
                width: 190,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFCE4EC),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(pinkColor),
                    ),
                    Text(
                      "Add New Address",
                      style: TextStyle(
                          color: Color(pinkColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                children: [],
              ),
            )
          ],
        ),*/
        body: _isLoading
            ? Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
            : SafeArea(
          child: Column(
            children: [
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
                    // _isLoading = true;
                  });
                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PlaceOrder(address_id:_selectedIndex)));*/
                  //  addAddress();
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: 20, bottom: 10, left: 20, right: 20),
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
