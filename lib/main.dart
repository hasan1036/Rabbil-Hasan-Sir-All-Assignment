import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // My Snack Bar Start
  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("message")));
  }

  // My Alert Dialog Bar Start

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text("Alert"),
              content: Text("Do you want to delete"),
              actions: [
                TextButton(
                    onPressed: () {
                      MySnackBar("Delete Success", context);
                      Navigator.of(context).pop();
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: UserAccountsDrawerHeader(
                accountName: Text("Fox"),
                accountEmail: Text("fox@gmail.com"),
                currentAccountPicture: Image.network(
                  "https://media.wired.com/photos/593261cab8eb31692072f129/master/w_2560%2Cc_limit/85120553.jpg",
                ),
              )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  MySnackBar("Home", context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("contacts"),
                onTap: () {
                  MySnackBar("contacts", context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("person"),
                onTap: () {
                  MySnackBar("person", context);
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("phone"),
                onTap: () {
                  MySnackBar("phone", context);
                },
              ),
            ],
          ),
          //child: ,
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {MyAlertDialog(context);}, child: Text("Show Alert Dialog")),
        ));
  }
}
