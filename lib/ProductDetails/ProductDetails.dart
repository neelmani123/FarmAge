import 'package:aov_farmage/helper/http_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:aov_farmage/CategoryDetails/ProductList/ProductListData.dart';
class ProductDetails extends StatefulWidget {
 final  List<Data>data1;
  const ProductDetails({this.data1,Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _isLoading=true;
  HttpServices _httpService=new HttpServices();
  Future<void>addToCart(String productID,String variantId)async{
    var res=await _httpService.add_to_cart(productId: productID,variantId: variantId);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        //my_cart();
        _isLoading=false;
      });
    }
  }
  Future<void>subToCart(String productID,String variantId)async{
    var res=await _httpService.sub_to_cart(productId: productID,variantId: variantId);
    if(res.status==true)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
       // my_cart();
        _isLoading=false;
      });
    }
    else if(res.status==false)
    {
      setState(() {
        Fluttertoast.showToast(msg: res.message);
        _isLoading=false;
        Navigator.pop(context);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    print("Product details is:${widget.data1[0].productName}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: widget.data1.length,
          itemBuilder: (context,index){
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${widget.data1[index].productImage??''}',)
                  )
              ),
            ),
            //SizedBox(height: 200,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${widget.data1[index].productName??''}',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${widget.data1[index].benefit??''}',style: TextStyle(color: Colors.grey),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${widget.data1[index].productsVariant[index].price??''}')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Divider(thickness: 2,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${widget.data1[index].productDescription}',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${widget.data1[index].benefit??''}',style: TextStyle(color: Colors.grey),),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Pieces:'),
                          Text('${widget.data1[index].productsVariant[index].mrp??''}',style: TextStyle(color: Colors.grey),),
                          Text('Gross:'),
                          Text('${widget.data1[index].productsVariant[index].unitValue??''}',style: TextStyle(color: Colors.grey),),
                          Text('Net:'),
                          Text('${widget.data1[index].productsVariant[index].unit??''}',style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity',style: TextStyle(fontWeight: FontWeight.bold),),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _isLoading=true;
                                    subToCart(widget.data1[index].productID,widget.data1[index].productsVariant[index].id);
                                  });
                                },
                                child: Container(
                                  width:25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey
                                  ),
                                  //margin: EdgeInsets.only(left:130,right: 15),
                                  padding: EdgeInsets.only(left: 8),
                                  child:Text('-',style: TextStyle(color: Colors.black,fontSize: 20),),
                                ),
                              ),
                              Container(
                                width:25,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orangeAccent
                                ),
                                //margin: EdgeInsets.only(left:130,right: 15),
                                padding: EdgeInsets.only(left: 7,top: 5),
                                child:Text('${2}',style: TextStyle(color: Colors.black,fontSize: 15),),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    _isLoading=true;
                                    addToCart(widget.data1[index].productID,widget.data1[index].productsVariant[index].id);
                                  });
                                },
                                child: Container(
                                  width:25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey
                                  ),
                                  //margin: EdgeInsets.only(left:130,right: 15),
                                  padding: EdgeInsets.only(left: 7),
                                  child:Text('+',style: TextStyle(color: Colors.black,fontSize: 20),),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Price',style: TextStyle(fontWeight: FontWeight.bold),),
                                Spacer(),
                                Text('${widget.data1[index].productsVariant[index].mrp??''}',style: TextStyle(color: Colors.grey),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              child: Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: 15),),),
                          ],
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
                              child: Text('Place Order',style: TextStyle(color: Colors.white,fontSize: 15),),),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      })
    );
  }
}
