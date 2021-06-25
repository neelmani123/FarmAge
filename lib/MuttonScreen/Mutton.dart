import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Mutton extends StatefulWidget {
  const Mutton({Key key}) : super(key: key);

  @override
  _MuttonState createState() => _MuttonState();
}

class _MuttonState extends State<Mutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 630,
            child: ListView.builder(
              itemCount: 2,
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
                height: 370,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/banner.png',),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text('Goat Curry Cut(Raan,Chaamp,Puth)',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 2),),
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
                          Text('Curry Cut',style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 5),
                      child: Row(
                        children: [
                          Text('Gross Weight:590gms',style: TextStyle(color: Colors.grey),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Pieces:3',style: TextStyle(color: Colors.grey),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Net Weight:500gms',style: TextStyle(color: Colors.grey),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 5),
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
                                    borderRadius: BorderRadius.all(Radius.circular(10)),),
                                  onPressed: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
                                  },
                                  color: Colors.orangeAccent,
                                  child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 17),),),
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
            child: Text('Out Of Stock',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
          )
        ],
      )
    );
  }
}
