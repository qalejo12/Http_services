import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_api/main.dart';

class Second extends StatefulWidget {

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome User"),
                    SizedBox(height: 58,),
                    OutlinedButton.icon(
                      onPressed: (){
                        logout();
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        size: 18,
                      ),
                      label: Text("Logout")),
                  ],
                ),
          )),
    );
  }

  Future<void> logout() async{

    Navigator.push(
    context, MaterialPageRoute(builder: (context)=>MyApp()));

  }
}