import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class ChangeAddress extends StatefulWidget {
  const ChangeAddress({Key key}) : super(key: key);

  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController build_name=new TextEditingController();
  TextEditingController location=new TextEditingController();
  TextEditingController flat_no=new TextEditingController();
  TextEditingController landmark=new TextEditingController();
  TextEditingController address_type=new TextEditingController();
  TextEditingController pincode=new TextEditingController();
  TextEditingController lant=new TextEditingController();
  TextEditingController long=new TextEditingController();
  TextEditingController person_name=new TextEditingController();
  TextEditingController person_mobile=new TextEditingController();
  TextEditingController note=new TextEditingController();
  bool _isLoading;
  HttpServices _httpService = HttpServices();
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      setState(() {
        _isLoading=true;
        add_address();
      });
    } else {
      print('Form is invalid');
    }
  }
  Future<void>add_address()async{
    var res=await _httpService.add_user_address(buildingName: build_name.text,flatNo: flat_no.text,landmark: landmark.text,lat: lant.text,long: long.text,location: location.text,pincode: pincode.text,personName: person_name.text,personMobile: person_mobile.text,address_type: address_type.text,note: note.text);
    if(res.status==true)
      {
        setState(() {
          _isLoading=false;
          Fluttertoast.showToast(msg: res.message);
          Navigator.pop(context);
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      Text('Change Address',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('')
                  )
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('Search for Area/Locality',style: TextStyle(color: Colors.grey,fontSize: 10),),
                        ),
                        Container(
                            height: 40,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                                  border: InputBorder.none,
                                  hintText: 'New Delhi,Anand Vihar,Near Mertro Station',
                                  hintStyle: TextStyle(color: Colors.black)
                              ),
                            )
                        ),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Building Name':null,
                          controller: build_name,
                          keyboardType:TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Building name/Street name'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Location':null,
                          keyboardType:TextInputType.text,
                          controller: location,
                          decoration: InputDecoration(
                              hintText: 'Location'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Flat no':null,
                          keyboardType:TextInputType.text,
                          controller: flat_no,
                          decoration: InputDecoration(
                              hintText: 'Flat No'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Landmark':null,
                          keyboardType:TextInputType.text,
                          controller: landmark,
                          decoration: InputDecoration(
                              hintText: 'Landmark'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Address type':null,
                          keyboardType:TextInputType.text,
                          controller: address_type,
                          decoration: InputDecoration(
                              hintText: 'Address Type'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value){
                            if(value.length!=6)
                            {
                              return 'Pincode must be 6 digit';
                            }
                            return null;
                          },
                          keyboardType:TextInputType.number,
                          controller: pincode,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          decoration: InputDecoration(
                              hintText: 'Pincode'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Latitude':null,
                          keyboardType:TextInputType.number,
                          controller: lant,
                          decoration: InputDecoration(
                              hintText: 'Latitude'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Longitute':null,
                          keyboardType:TextInputType.number,
                          controller: long,
                          decoration: InputDecoration(
                              hintText: 'Longitude'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Name':null,
                          keyboardType:TextInputType.text,
                          controller: person_name,
                          decoration: InputDecoration(
                              hintText: 'Person Name'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value){
                            if(value.length!=10)
                            {
                              return 'Enter valid mobile number';
                            }
                            return null;
                          },
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          keyboardType:TextInputType.number,
                          controller: person_mobile,
                          decoration: InputDecoration(
                              hintText: 'Person Mobile'
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          validator: (value)=>value.isEmpty?'Enter Note':null,
                          keyboardType:TextInputType.text,
                          controller: note,
                          decoration: InputDecoration(
                              hintText: 'Note'
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 100,
                          height: 50,
                          padding: EdgeInsets.only(left: 70,right: 70),
                          //margin: EdgeInsets.only(left: 20,),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),),
                            onPressed: (){
                              setState(() {
                                validateAndSave();
                              });
                            },
                            color: Colors.orangeAccent,
                            child: _isLoading==true ?Container(height:20,width:20,child: CircularProgressIndicator(),):Text('Save & Proceed',style: TextStyle(color: Colors.white,fontSize: 17),),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            /*  SlidingUpPanel(
               // minHeight: 30,
                renderPanelSheet: true,
                maxHeight: MediaQuery.of(context).size.height,
                //minHeight: 300,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                panelBuilder: (sc) => _panel(sc),
              ),*/
          ],
        ),
      ),

    );
  }
  /*Widget _panel(ScrollController sc){
    return MediaQuery.removePadding(context: context,
        child: );
  }*/
}


