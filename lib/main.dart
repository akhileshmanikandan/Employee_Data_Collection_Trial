import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:searchfield/searchfield.dart';

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

  void inputIntoSheet() async{
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(spreadsheetid);
    var sheet = ss.worksheetByTitle('Worksheet1');

    //await sheet!.values.insertValue('Input', column: 1, row: counter);
    //final cell = await sheet.cells.cell(column: 5, row: 5);
    //final firstRow = ['index', 'letter', 'number', 'label'];
    //await sheet.values.insertRow(1, firstRow);

    await sheet?.values.map.appendRow(nextRow);
  }

  final name = TextEditingController();
  final project = TextEditingController();
  final init = TextEditingController();
  final EM = TextEditingController();
  final designation_selected = TextEditingController();

  String lol = '';

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

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Enter your designation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),//Designation drop down

                  DecoratedBox(
                    decoration: BoxDecoration(
                        color:Colors.white, //background color of dropdown button
                        border: Border.all(color: Colors.grey, width:1), //border of dropdown button
                        borderRadius: BorderRadius.circular(15), //border raiuds of dropdown button
                        // boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                        //   BoxShadow(
                        //       color: Colors.grey, //shadow for button
                        //       blurRadius: 5) //blur radius of shadow
                        // ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: 300,
                         child: DropdownButton<String>(
                           //alignment: Alignment.center,
                            value: dropdownValue,
                            //icon: const Icon(Icons.arrow_downward,),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 0,
                              color: Colors.white,
                        ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          lol = newValue;

                        });
                      },
                      items: <String>['Analyst', 'Associate Consultant', 'Consultant', 'Assistant Manager', 'Manager',]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
                    ),
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
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter text',),
                    controller: EM,
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
                        nextRow = {
                          'Name': name.text,
                          'Project Details': project.text,
                          'Initiative': init.text,
                          'Engagement Manager': EM.text,
                          'Designation': lol,
                        };
                        inputIntoSheet();
                        
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


