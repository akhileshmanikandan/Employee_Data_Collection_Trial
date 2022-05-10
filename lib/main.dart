import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'admin_login_page.dart';

class Employee_details {
  late int id;
  late String name;
  late String designation;
  late String project;
  late String initiative;
  late String engagement_manager;
  late String start_date;
  late String end_date;

  Employee_details({
    required this.id,
    required this.name,
    required this.designation,
    required this.project,
    required this.initiative,
    required this.engagement_manager,
    required this.start_date,
    required this.end_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'project': project,
      'initiative': initiative,
      'engagement_manager': engagement_manager,
      'start_date':start_date,
      'end_date':end_date,
    };
  }
  @override
  String toString() {
    return '\nEmployee Details --- \n\t\t\t id: $id\n\t\t\t name: $name\n\t\t\t designation: $designation\n\t\t\t project: $project\n\t\t\t initiative: $initiative\n\t\t\t engagement_manager: $engagement_manager\n\t\t\t start_date: $start_date\n\t\t\t end_date: $end_date\n';
  }
}

const credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-g-348007",
  "private_key_id": "b586b4685d0fd99564801acbefb62f4eceb466cd",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDe//Pu2VceyZYo\n4d9GsfJB1YtjOAnEQfmwyTFRvVkUDnTT2vRj+g5jP/un1r4uf26SQmKs3JZfD7pJ\ndMtDb+0g1uwjjecSDMz4oL0rO/hcBha2OX2+il6OEsLJccW0YoRKFP1NqI6vXNhk\ncY35CjUSHq05MIJSB27RgsA8MS0OYMOHzv9PYwboXevgNp/7ksibYfKtAEA7nAJ9\nXh9UQ2KUrWOH/7Fy4d3XW+7172BZ3yvhrCHHHz30XIVwBzt2aZKDpFO47Kn/nlA1\nqtdRlihXwImT4oqpst8E7wwtACDKcek7WbjrRMcZsYRg2JSVhIF6Sj24HJpOeoxA\n5XOa1wqrAgMBAAECggEAEs/Dq6Pw+ftma+d19tg/B/e0LPgGtuQb5KJsQyl2cL8x\ncse3MxHekdfNamCupWyBjtwDx/JJyxYgEF9GYFd6SPlobS1kzzx+NAEXRCTodBbd\nZpzd8ytoA5MolGbBF1DyOO+hWKI9+yQZawu7PsVyKael1Du32qSe4BSoE8vQMbSm\nl5cwLQhCxdm6nt0XdHeS4zH5xvzeebkjA5Jk7Z0a/GiBtzEPUdkkEkTTbOr9C0nW\nN74HZFHVPjujqa0b00w4PIMpXTFb61ClStAm/0defDnWIxQelYKxV4WAZsw8s3x5\nvuWxIyZqhxhldYrb3V0Ss90tnRJpQ4cq0USeXJfOfQKBgQD9uHNQPsNFEk+LYGHH\nU8/OW/f4z2PRGskY/CKLljVclsmDfKFNzWvLE5FyQfhCSbrMbxuxSsYH8DEXHWw9\nc2TXi+zdHFBZDxAnvxExDQvPjYWZlgJYWAlNd2D+IIxqGDPANrZ0dnI/xOFIk22S\n1kuxqaOb5UFLR3uIhZeCIj/tZQKBgQDhANiC2yrSVsMhwEdkMbpBdAANr6VlWn3/\n/+fbVJG8HFYa6aVCYU0kmLtKN/x9mgWx9dQziBOWd7UUMpKWdC/ir+DdvamT19M9\nrFEwrZc1IVy/MIuWv+cpZuWlMvjFyBFTZL9raBX8zs8M3+b+fspqmBggwjVtRIQm\nat/wQd9ezwKBgQC7SIQWH74UJkgBIcwLTpp+QPTx/GQ53gPDJZp6Xw5UohltrXmD\n7LY82Nzr8jZG+BWjAgD3BbLX+TzDSzyyv5MYaHkXXecRVkUekbMm+fJV6qlLjad9\nfr6fKBe4fl4nkmXg5IIZxbTfzXxeDjU7xmNpaUcTtE5WOxW82J/Vt2Jo4QKBgCqb\nOGR/D/rIhybK/DnS2MwwJRpyWkV4/0cMtGDqALa4Pu3VtH9/YVY+vahuNZerJMzw\nGgCwEdV6UYXDldJ7qd2pJFGY6pWeVtfk23L2TB25dZCWprgjGqjSXUYNAuKg4fcC\nquSxzwgSOU7czyb952KL7nW1kNxiDwwfTMx4DM4tAoGAQo2JcvxkxCqVucZDEUxx\nD9jolRBk93nDNj1N0JsS1wXzm5nl5ExmOsLGwsYxauCz+JIMP7uQuKqh4bIsL9XJ\nX6N8Z4Io5now/4/4mWn1d4xPVHEeGXnR8VbTe5BPPJHlivaDktUhQb+5J8j5zm0y\njDeDHzmVR3O7K0xDjP5BYi4=\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets-tutorial@flutter-g-348007.iam.gserviceaccount.com",
  "client_id": "112705490731456949884",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets-tutorial%40flutter-g-348007.iam.gserviceaccount.com"
}

''';

const spreadsheetid = '1EOEQ1HjRwg1Kcewu3SGqsCieSgXbVzDvFh3niBdgdc4';



void main() async
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Employee Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Employee Details'),
    );
  }
}

class MyHomePage extends StatefulWidget
{

  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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


  void put_into_db(int id_a, String name_a, String designation_a, String project_a, String initiative_a, String engagement_manager_a, String start_date_a, String end_date_a) async{
    var fido = Employee_details(
      id: 0,
      name: '',
      designation: '',
      project: '',
      initiative: '',
      engagement_manager: '',
      start_date: '',
      end_date: '',
    );

    fido.id = id_a;
    fido.name = name_a;
    fido.designation = designation_a;
    fido.project = project_a;
    fido.initiative = initiative_a;
    fido.engagement_manager = engagement_manager_a;
    fido.start_date = start_date_a;
    fido.end_date = end_date_a;


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
    Future<void> insertEmployee(Employee_details database2) async {
      final db = await database;
      await db.insert(
        'database2',
        database2.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await insertEmployee(fido);
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
    print(await database2());
  }

  void inputIntoSheet() async{
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(spreadsheetid);
    var sheet = ss.worksheetByTitle('Worksheet1');

    await sheet?.values.map.appendRow(nextRow);
  }

  String start_date_rev = '';
  String end_date_rev = '';

  late String EM;
  final emp_id = TextEditingController();
  final name = TextEditingController();
  final project = TextEditingController();
  final init = TextEditingController();
  late String designation_selected;
  final del = TextEditingController();


  //String select_designation;
  String dropdownValue='Analyst';

  //Blank row initialization
  var nextRow =
  {
    'Name': '',
    'Project Details': '',
    'Initiative': '',
    'Engagement Manager': '',
    'Designation':'',
    'Start Date':'',
    'End Date':'',
  };

  List <String> designations = [
    'Analyst', 'Associate Consultant', 'Consultant', 'Assistant Manager', 'Manager',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        //FORM TO FILL
        child: Container(
          //height: double.infinity,
          //elevation: 6,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.,
                children: <Widget>[

                  //Employee ID
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Enter your Employee ID',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter text',),
                    controller: emp_id,
                    keyboardType: TextInputType.number,
                  ),
                  Text(''),

                  //Name details
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Enter your full name',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter text',),
                    controller: name,
                  ),
                  Text(''),

                  //Designation Details
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Enter your designation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),//Designation drop down
                  DropdownSearch<String>(
                    maxHeight: 300,
                    //mode of dropdown
                    mode: Mode.DIALOG,
                    //to show search box
                    showSearchBox: true,
                    showSelectedItems: true,
                    //list of dropdown items
                    items: [
                      "Analyst",
                      "Associate Consultant",
                      "Consultant",
                      "Assistant Manager",
                    ],
                    //label: "Country",
                    onChanged: (data) => designation_selected = data.toString(),
                    //show selected item
                    selectedItem: "",
                  ),
                  Text(''),

                  // Project Details
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Which project/s are you currently working on?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter text',),
                    controller: project,
                  ),
                  Text(''),

                  //Initiative Details
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Any initiative/s you have taken up?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter text',),
                    controller: init,
                  ),
                  Text(''),

                  //Engagement Manager Details
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Who is your Engagement Manager?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DropdownSearch<String>(
                    //mode of dropdown
                    mode: Mode.DIALOG,
                    //to show search box
                    showSearchBox: true,
                    showSelectedItems: true,
                    //list of dropdown items
                    items: [
                      "Subuhee Parray",
                      "Nishanth Mallinath",
                      "Arjun Malhotra",
                      "Sumit Kapoor",
                      "Sandeep Gill",
                      "Chaitanya Karmakar",
                      "Shivam Awasthi",
                      "Ramesh Kadamata",
                      "Rekha Madandas Vaishnav",
                      "Avinash CH",
                      "Yatin Gaind",
                      "Ashish Agnihotri",
                      "Kunal Roy",
                      "Seema Singh",
                      "Sonal Jain",
                      "Samarth Arora",
                      "Ritu Birla",
                      "Ujjwal Agarwal",
                      "Ankit Jain",
                      "Bhanu Pratap",
                      "Vinay Sharma",
                      "Mahendra Pandey",
                      "Arjun Iyer",
                      "Yasharth Srivastava",
                    ],
                    //label: "Country",
                    onChanged: (data) => EM = data.toString(),

                    //show selected item
                    selectedItem: "",
                  ),

                  Text(''),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Start and end date of project?',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Card(
                  elevation: 5,
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                      final dynamic value = args.value;
                      start_date_rev = (value.toString().substring(33,43));
                      //print(start_date_rev);


                      end_date_rev = (value.toString().substring(67,77));
                      //print(end_date_rev);
                    },
                  ),
                ),

                  //Submit Button
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
                        child: Text("SUBMIT",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),),
                        onPressed:
                          (){
                          put_into_db(int.parse(emp_id.text),name.text,designation_selected,project.text,init.text,EM,start_date_rev,end_date_rev);
                          //get_from_db();
                          //delete_from_db(257);


                        // nextRow = {
                        //   'Name': name.text,
                        //   'Project Details': project.text,
                        //   'Initiative': init.text,
                        //   'Engagement Manager': EM.text,
                        //   'Designation': lol,
                        //   'Start Date': start_date_rev,
                        //   'End Date': end_date_rev,
                        // };
                        // inputIntoSheet();

                        showDialog(context: context, builder: (context){
                          return Dialog(
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text("Your response has been recorded.\nThank you for submitting!", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          );
                        });


                      },
                      ),
                    ),
                  ),
                  //delet and view button coded out
                  //View button
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 30),
                  //   child: SizedBox(
                  //     height: 80,
                  //     width: 150,
                  //     child: ElevatedButton(
                  //       //color: Colors.blue,
                  //       style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(25.0),
                  //           ))),
                  //       child: Text("VIEW DB",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(fontSize: 30),),
                  //       onPressed:
                  //           (){
                  //         //put_into_db(int.parse(emp_id.text),name.text,lol,project.text,init.text,EM.text,start_date_rev,end_date_rev);
                  //         get_from_db();
                  //         //delete_from_db(257);
                  //
                  //
                  //         // nextRow = {
                  //         //   'Name': name.text,
                  //         //   'Project Details': project.text,
                  //         //   'Initiative': init.text,
                  //         //   'Engagement Manager': EM.text,
                  //         //   'Designation': lol,
                  //         //   'Start Date': start_date_rev,
                  //         //   'End Date': end_date_rev,
                  //         // };
                  //         //inputIntoSheet();
                  //
                  //         showDialog(context: context, builder: (context){
                  //           return Dialog(
                  //             elevation: 20,
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(15.0),
                  //               child: Text("View the database on the laptop", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                  //             ),
                  //           );
                  //         });
                  //
                  //
                  //       },
                  //     ),
                  //   ),
                  // ),
                  //
                  //
                  // //delete button inputs and texts
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                  //   child: Text(
                  //     'Which ID do you want to delete?',
                  //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  //     hintText: 'Enter text',),
                  //   controller: del,
                  //   keyboardType: TextInputType.number,
                  // ),
                  // Text(''),
                  //
                  // //delete button
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 30),
                  //   child: SizedBox(
                  //     height: 80,
                  //     width: 150,
                  //     child: ElevatedButton(
                  //       //color: Colors.blue,
                  //       style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(25.0),
                  //           ))),
                  //       child: Text("DELETE",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(fontSize: 30),),
                  //       onPressed:
                  //           (){
                  //         //put_into_db(int.parse(emp_id.text),name.text,lol,project.text,init.text,EM.text,start_date_rev,end_date_rev);
                  //         //get_from_db();
                  //         delete_from_db(int.parse(del.text));
                  //
                  //
                  //         // nextRow = {
                  //         //   'Name': name.text,
                  //         //   'Project Details': project.text,
                  //         //   'Initiative': init.text,
                  //         //   'Engagement Manager': EM.text,
                  //         //   'Designation': lol,
                  //         //   'Start Date': start_date_rev,
                  //         //   'End Date': end_date_rev,
                  //         // };
                  //         //inputIntoSheet();
                  //
                  //         showDialog(context: context, builder: (context){
                  //           return Dialog(
                  //             elevation: 20,
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(15.0),
                  //               child: Text("Item has been deleted", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                  //             ),
                  //           );
                  //         });
                  //
                  //
                  //       },
                  //     ),
                  //   ),
                  // ),

                  //admin page button

                  //admin page
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    height: 80,
                    width: 150,
                      child:ElevatedButton(
                          style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ))),
                          onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminLoginPage()));
                       },
                          child: Text('ADMIN PAGE',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),))
                  )
                )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


