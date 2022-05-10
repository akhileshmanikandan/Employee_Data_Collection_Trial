import 'package:flutter/material.dart';

import 'admin_page.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  AdminLoginPageState createState() => AdminLoginPageState();
}


class AdminLoginPageState extends State<AdminLoginPage> {
  @override

  final username = TextEditingController();
  final password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Login Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Enter your username',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter text',),
                  controller: username,
                ),
                Text(''),

                //Name details
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Enter password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter text',),
                  controller: password,
                ),
                Text(''),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    height: 80,
                    width: 150,
                    child: ElevatedButton(
                        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))),
                        onPressed: (){
                      if(username.text=='flutter_team'&&password.text=='kpmg'){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminPage()));}
                      else{
                        showDialog(context: context, builder: (context){
                          return Dialog(
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("Incorrect Username/Password.\nPlease try again", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          );
                        });
                      }
                    }, child: Text('LOGIN',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),))
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}