import 'package:flutter/material.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedRadio;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
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
                      Text('Choose Payment Method',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Payment Method'),
            ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Card(
            color: Colors.grey,
            child: Container(
              //margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet_sharp,color: Colors.orangeAccent,size: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Debit Card",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Text('123****'),
                      )
                    ],
                  ),
                  trailing: Radio(
                      activeColor: Colors.orangeAccent,
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                       // setSelectedRadio(val);
                      })),
            ),
          ),
        ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Colors.grey,
                child: Container(
                  //margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet_sharp,color: Colors.orangeAccent,size: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Debit Card",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text('123****'),
                          )
                        ],
                      ),
                      trailing: Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (val) {
                            // setSelectedRadio(val);
                          })),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Colors.grey,
                child: Container(
                  //margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet_sharp,color: Colors.orangeAccent,size: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Debit Card",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text('123****'),
                          )
                        ],
                      ),
                      trailing: Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (val) {
                            // setSelectedRadio(val);
                          })),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Colors.grey,
                child: Container(
                  //margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet_sharp,color: Colors.orangeAccent,size: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Debit Card",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text('123****'),
                          )
                        ],
                      ),
                      trailing: Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (val) {
                            // setSelectedRadio(val);
                          })),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Colors.grey,
                child: Container(
                  //margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet_sharp,color: Colors.orangeAccent,size: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Debit Card",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text('123****'),
                          )
                        ],
                      ),
                      trailing: Radio(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (val) {
                            // setSelectedRadio(val);
                          })),
                ),
              ),
            ),
            SizedBox(height: 50,),
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
            SizedBox(height: 10,),
          ],
        ),
      ),
    );

  }
}
