import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class LoginScreen extends StatefulWidget{
  _LoginState createState()=>_LoginState();

}
class _LoginState extends State<LoginScreen>{
  final _usernameController=TextEditingController();
  final _passwordController=TextEditingController();
  void _validate() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;
    if (username == "user" && password == "1234") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home()));
    }
    else {
      showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: Text("Wasted"),
                content: Text("Incorrect username or password!"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Ok"))
                ],
              ));
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("New World"),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: _validate,
                child: Text("Enter")),
          ],
        ),

      ),
    );
  }

}
