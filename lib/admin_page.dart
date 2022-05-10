import 'package:flutter/material.dart';
import 'package:flutter_gsheets/view_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'main.dart';
var lolol='';
List list = [];
List stringlist =[];

class AdminPage extends StatefulWidget {
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  final del = TextEditingController();

  void delete_from_db(int id) async{
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'database2.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE database2(id INTEGER PRIMARY KEY, name TEXT, designation TEXT, project TEXT, initiative TEXT, engagement_manager TEXT, start_date TEXT, end_date TEXT)',
        );
      },
      version: 1,
    );
    //Future<void> deleteEmployee(int id) async {
    final db = await database;
    await db.delete(
      'database2',
      where: 'id = ?',
      whereArgs: [id],
    );
    //}
  }

  void get_from_db() async{
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'database2.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE database2(id INTEGER PRIMARY KEY, name TEXT, designation TEXT, project TEXT, initiative TEXT, engagement_manager TEXT, start_date TEXT, end_date TEXT)',
        );
      },
      version: 1,
    );
    Future<List<Employee_details>> database2() async {
      // Get a reference to the database.
      final db = await database;

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('database2');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return Employee_details(
          id: maps[i]['id'],
          name: maps[i]['name'],
          designation: maps[i]['designation'],
          project: maps[i]['project'],
          initiative: maps[i]['initiative'],
          engagement_manager: maps[i]['engagement_manager'],
          start_date: maps[i]['start_date'],
          end_date: maps[i]['end_date'],
        );
      });
    }
    list = await database2();
    lolol = list.toString();
    print(await database2());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: <Widget>[
                //view button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    height: 80,
                    width: 150,
                    child: ElevatedButton(
                      //color: Colors.blue,
                      style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                      child: Text("VIEW DB",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),),
                      onPressed:
                          (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewDatabase()));
                        //put_into_db(int.parse(emp_id.text),name.text,lol,project.text,init.text,EM.text,start_date_rev,end_date_rev);
                        get_from_db();
                        //delete_from_db(257);

                        // showDialog(context: context, builder: (context){
                        //   return Dialog(
                        //     elevation: 20,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(15.0),
                        //       child: Text("View the database on the laptop", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                        //     ),
                        //   );
                        // });


                      },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Which ID do you want to delete?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter text',),
                  controller: del,
                  keyboardType: TextInputType.number,
                ),
                Text(''),
                //delete button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    height: 80,
                    width: 150,
                    child: ElevatedButton(
                      //color: Colors.blue,
                      style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                      child: Text("DELETE",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),),
                      onPressed:
                          (){
                        //put_into_db(int.parse(emp_id.text),name.text,lol,project.text,init.text,EM.text,start_date_rev,end_date_rev);
                        //get_from_db();
                        delete_from_db(int.parse(del.text));

                        showDialog(context: context, builder: (context){
                          return Dialog(
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("Item has been deleted", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          );
                        });


                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}