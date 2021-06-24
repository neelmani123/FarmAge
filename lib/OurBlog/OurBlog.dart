import 'package:aov_farmage/OurBlog/OurBlog1.dart';
import 'package:flutter/material.dart';
class OurBlog extends StatefulWidget {
  const OurBlog({Key key}) : super(key: key);

  @override
  _OurBlogState createState() => _OurBlogState();
}

class _OurBlogState extends State<OurBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10,right: 5),
            width: MediaQuery.of(context).size.width,
           child: Text('Biryani is an evergreen classic dish that needs no introduction.\nIt is one of the'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(Icons.watch_later,size: 17,),
                Text('10th April'),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('|'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('12k'),
                ),
                Icon(Icons.linked_camera,size: 17,),
                Spacer(),
                Container(
                  width:130,
                  height: 30,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OurBlog1()));
                    },
                    color: Colors.orangeAccent,
                    child: Row(
                      children: [
                        Text('Read More',style: TextStyle(color: Colors.white,fontSize: 17),),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                      ],
                    ),),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/banner.png')
                )
            ),
          ),
        ],
      ),
    );
  }
}
