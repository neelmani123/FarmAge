import 'package:flutter/material.dart';
class OurBlog1 extends StatefulWidget {
  const OurBlog1({Key key}) : super(key: key);

  @override
  _OurBlog1State createState() => _OurBlog1State();
}

class _OurBlog1State extends State<OurBlog1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text('Our Blog',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/banner.png')
                  )
              ),
            ),
            Center(
              child: Text('MAKING THE PERFECT BIRYANI',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(right: 20),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.watch_later),
                  Text('10th April'),
                  Text('12k'),
                ],
              )
            ),
            SizedBox(height: 5,),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 10,right: 5),
              width: MediaQuery.of(context).size.width,
              child: Text('Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('DRY SPICES',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 10,right: 5),
              width: MediaQuery.of(context).size.width,
              child: Text('Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('DRY SPICES',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 10,right: 5),
              width: MediaQuery.of(context).size.width,
              child: Text('Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('FRESH MEAT OR CHICKEN',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.only(left: 10,right: 5),
              width: MediaQuery.of(context).size.width,
              child: Text('Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the,Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the'),
            ),
          ],
        ),
      ),
    );
  }
}
