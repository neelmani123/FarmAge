import 'package:aov_farmage/CategoryDetails/ProductList/ProductListData.dart';
import 'package:aov_farmage/YourCart/YourCart.dart';
import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    var res=await _httpService.add_to_cart(productId: productID,variantId: "10053");
    if(res.status==true)
      {
        setState(() {
          Fluttertoast.showToast(msg: res.message);
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
                height: 390,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network('${data[index].productImage??''}',width:MediaQuery.of(context).size.width,height: 270,fit: BoxFit.cover
                      ,),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 5),
                      child: Row(
                        children: [
                          Text('Gross Weight:590gms',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Net Weight:500gms',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 0),
                      child: Row(
                        children: [
                          Text('420.00'),
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
