
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
class home extends StatelessWidget {
  const home({super.key});
  Future<void> _logout(BuildContext context) async{
    SharedPreferences sh=await SharedPreferences.getInstance();
    await sh.remove('islogged');
    if(context.mounted){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const logginin()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Home',style: TextStyle(fontSize: 20),),
                  Text('World',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                  child:IconButton(
                      icon: Icon(Icons.logout,color: Colors.purpleAccent,),
                      onPressed: ()=>_logout(context),)
                  ),
                    ],
              )
            ],
          )
        ],
      ),
    );
  }
}
