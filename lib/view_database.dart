import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_gsheets/admin_page.dart';

import 'main.dart';
class ViewDatabase extends StatefulWidget {
  @override
  ViewDatabaseState createState() => ViewDatabaseState();
}

class ViewDatabaseState extends State<ViewDatabase>{

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

    print(await database2());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: Text("Database"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  lolol),
            ),
          ],
        ),
      ),

    );
  }
}