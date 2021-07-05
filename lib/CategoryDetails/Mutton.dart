import 'package:aov_farmage/CategoryDetails/ProductList/ProductListData.dart';
import 'package:aov_farmage/ProductDetails/ProductDetails.dart';
import 'package:aov_farmage/YourCart/YourCart.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Mutton extends StatefulWidget {
  final cat_id;
  const Mutton({this.cat_id,Key key}) : super(key: key);

  @override
  _MuttonState createState() => _MuttonState();
}

class _MuttonState extends State<Mutton> {
  bool _isLoading=true;
  HttpServices _httpService = HttpServices();
  List<Data>data=[];
  String selected;
  bool visibilityTag = false;
  Future<void>product_list_api()async{
    var res=await _httpService.product_details(catId: widget.cat_id);
    if(res.status==true)
      {
        setState(() {
          _isLoading=false;
          data=res.data;
          print("Data is:${data}");
        });
      }
  }
  Future<void>addToCart(String productID)async{
    final prefs=await SharedPreferences.getInstance();
    print("Variant Id is:${prefs.getString('variant_id')}");
    print("Product Id is:${(productID)}");
    var res=await _httpService.add_to_cart(productId: productID,variantId: prefs.getString('variant_id'));
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
          _isLoading=false;
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>YourCart()));
        });
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    product_list_api();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading==true?Container(child: Center(child: CircularProgressIndicator(),),):Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Container(
            height: 620,
            padding: EdgeInsets.only(left: 5,right: 5),
            child: ListView.builder(
              itemCount: data.length,
                itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  border: Border.all(
                    color: Colors.grey,
                        width: 2
                  )
                ),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ProductDetails(data1:data,)));
              },
                      child: Image.network('${data[index].productImage??''}',width:MediaQuery.of(context).size.width,height: 270,fit: BoxFit.cover
                        ,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('${data[index].productName??''}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 2),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 5),
                      child: Row(
                        children: [
                          Text('Bone-In & Boneless',style: TextStyle(color: Colors.grey),),
                          Container(
                            height: 20,
                            child: VerticalDivider(
                               thickness: 2,
                            ),
                          ),
                          Text('Small Pieces',style: TextStyle(color: Colors.grey),),
                          Container(
                            height: 20,
                            child: VerticalDivider(
                              thickness: 2,
                            ),
                          ),
                          Text('${data[index].catName??''}',style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                content: Container(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Text("Available quantities for",style: TextStyle(color: Colors.grey),),
                                      SizedBox(height: 10,),
                                      Text('${data[index].productName}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 20,),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(1),
                                            border: Border.all(
                                              color: Colors.grey,
                                            )
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            hint: Text('Select qty'),
                                            value: selected,
                                            items: data[index].productsVariant.map((item){
                                              return new DropdownMenuItem(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 5),
                                                        child: Text(item.weight??''),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 15),
                                                        child: Text(item.mrp??''),
                                                      )
                                                    ],
                                                  ),
                                                value: item.id.toString(),
                                              );
                                            }).toList(),
                                            onChanged: (val){
                                              setState(() async{
                                                selected=val;
                                                print("Selected is:${selected}");
                                                SharedPreferences _prefs=await SharedPreferences.getInstance();
                                                _prefs.setString('variant_id',selected);
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(left: 15,top: 5),
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            border: Border.all(
                                color: Colors.grey,
                            )
                        ),
                        child:(visibilityTag)?Row(
                          children: [
                            Text('${data[index].productsVariant[index].unitValue}'),
                            Text('${data[index].productsVariant[index].unit}'),
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Icon(Icons.keyboard_arrow_down_rounded),
                            )
                          ],
                        ):Row(
                          children: [
                            Text('${data[index].productsVariant[index].unitValue}'),
                            Text('${data[index].productsVariant[index].unit}'),
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Icon(Icons.keyboard_arrow_down_rounded),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 0),
                      child: Row(
                        children: [
                          Text('${data[index].productsVariant[0].mrp}'),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(Icons.pedal_bike),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text('Available In 90 minutes'),
                          ),
                          Spacer(
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),),
                                  onPressed: (){
                                    setState(() {
                                      addToCart(data[index].productID);
                                      _isLoading=true;
                                    });
                                  },
                                  color: Colors.orangeAccent,
                                  child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
          Divider(
            thickness: 3,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('Out Of Stock',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            ),
          )
        ],
      )
    );
  }
}
