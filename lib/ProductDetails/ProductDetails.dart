import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:aov_farmage/CategoryDetails/ProductList/ProductListData.dart';
class ProductDetails extends StatefulWidget {
  final List<Data> data1;
  const ProductDetails({this.data1,Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://devclub.co.in/aov_farmage/admin/uploads/products/product1624342420.jpg',),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                    ),
                    height: 500,
                    child: Scaffold(
                      body: SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                          ),
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Rack of Lamp',style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Firm,sweet and mind-flavoured,these large sea Prawns\n have a deliciously',style: TextStyle(color: Colors.grey),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('200')
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Divider(thickness: 2,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Introduction',style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Firm,sweet and mind-flavoured,these large sea Prawns\n have a deliciously',style: TextStyle(color: Colors.grey),),
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
                                      Text('20+',style: TextStyle(color: Colors.grey),),
                                      Text('Gross:'),
                                      Text('500Gms',style: TextStyle(color: Colors.grey),),
                                      Text('Net:'),
                                      Text('480Gms',style: TextStyle(color: Colors.grey),),
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
                                           Text('200',style: TextStyle(color: Colors.grey),),

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
                                          child: Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: 17),),),
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
                                          child: Text('Place Order',style: TextStyle(color: Colors.white,fontSize: 17),),),
                                      ],
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                );
              },
                child: Center(child: Text('Bottom Sheet')))
          ],
        ),
      ),
    );
  }
}
