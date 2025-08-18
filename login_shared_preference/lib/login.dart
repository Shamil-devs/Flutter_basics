
import 'package:login_shared_preference/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class logginin extends StatefulWidget {
  const logginin({super.key});

  @override
  State<logginin> createState() => _loggininState();
}

class _loggininState extends State<logginin> {
  final _user=TextEditingController();
  final _pass=TextEditingController();
  Future<void> validate() async{
  String username=_user.text.trim();
  String password=_pass.text;
  if(username=='shamil' && password=='123'){
    final SharedPreferences sh=await SharedPreferences.getInstance();
    await sh.setBool('islogged',true);
    if(mounted){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const home()));
    }
  }
  else{
    showDialog(context: context, builder: (_)=>AlertDialog(
      title: Text('Wrong!'),
      content: Text('Wrong username or password'),
      actions: [
TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Ok'))
      ],
    ));
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),),
          TextField(
            controller: _user,
            decoration: InputDecoration(labelText: 'username',border: UnderlineInputBorder()),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: _pass,
            decoration: InputDecoration(labelText: 'password',border: UnderlineInputBorder()),
            obscureText: true,
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: validate, child: Text('Login'))
        ],

        ),
      ),
    );
  }
}
