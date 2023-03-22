import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_api/second.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email", 
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email_rounded)),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password", 
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password_rounded)),
              ),
              SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                onPressed: (){
                  login();
                },
                icon: Icon(
                Icons.login_rounded,
                size: 18,
                ),
                label: Text("Login"))
            ],
        ))),
      ),
    );
  }


  //CREATE FUNCTION TO CALL LOGIN POST API
  Future<void> login() async{

      /*
        var url = Uri.parse('https://yourapi.com/api/login');
        var body = jsonEncode({'username': 'your_username', 'password': 'your_password'});
        var headers = {'Content-Type': 'application/json'};
        var response = await http.post(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        var accessToken = responseBody['access_token'];
        // Almacenar el token de acceso para su uso posterior
        print('Access token: $accessToken');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }*/
    
    if(passController.text.isNotEmpty && emailController.text.isNotEmpty){
      var response = await http.post(Uri.parse("https://reqres.in/api/login"), 
          body: ({
            'email':emailController.text,
            'password':passController.text
          }));
          if(response.statusCode == 200){
            Navigator.push(
              context, MaterialPageRoute(builder: (context)=>Second()));
          }else{
            ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials.")));
          }
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Empty Field Not Allowed")));
    }
    
  } 

}
