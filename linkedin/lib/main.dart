

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Linkedin());
}

class Linkedin extends StatelessWidget {
  const Linkedin({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Linkedin",
      home: Home(),

    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          _topbar(),
          const Divider(height: 1,color: Colors.indigo,),
          _postbar(),
          _postcontent(),
          _postimage(),
          _posticons(),

        ],
      ),

      ),
      bottomNavigationBar: _bottomnav(),
    );
  }
}
Widget _topbar(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/f/f4/USAFA_Hosts_Elon_Musk_%28Image_1_of_17%29_%28cropped%29.jpg'),
          radius: 20,
        ),
        SizedBox(width: 10,),
        Expanded(
            child:Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 36,

              decoration: BoxDecoration(color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,

              )),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10,),
                  const Text('Search')
                ],
              ),

            ),
        ),
        SizedBox(width:10),
        Icon(Icons.message)

          

      ],
    ),


  );
}

Widget _postbar(){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt9VkUJeKPUrYK0238tEW4opzqndBTyVLTnA&s'),
          radius: 25,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(text: const TextSpan(
                style: TextStyle(fontSize: 16,color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Elon musk',
                    style: TextStyle(fontWeight: FontWeight.bold)

                  ),
                  TextSpan(
                    text: '.1st',
                    style: TextStyle(fontSize: 13,color: Colors.grey)

                  )
                ],
                ),
              ),
              SizedBox(height: 3,),
              const Text('Full stack Developer | MERN | Python',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 3,),
              const Text('19m 🌍',style: TextStyle(color: Colors.grey),
              ),


            ],
          ),
        ),
        const Icon(Icons.more_horiz),

      ],
    ),
  );
}

Widget _postcontent(){
  return Padding(padding: EdgeInsets.symmetric(horizontal:5,vertical: 10),
    child: Text('succesfully launched a rocket'),
  );
}
Widget _postimage(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
  child: Container(
    child: Stack(
      children: [
        Image.network('https://static.themoscowtimes.com/image/article_1360/93/8MnUsT6Wnho.jpg',
        fit: BoxFit.cover,),

        Positioned(
          bottom: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text(
                    'with Bridgeon',
                    style: TextStyle(color:Colors.white,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )),

      ],
    ),

  ),
  );
}
Widget _posticons(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical:10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          _btn(icon: Icons.thumb_up, txt: 'Like'),
        _btn(icon: Icons.message, txt: 'comment'),
        _btn(icon: Icons.loop, txt: 'Repost'),
        _btn(icon: Icons.share, txt: 'Sent'),
      ],
  ),

  );
}
Widget _btn({required IconData icon, required String txt}){
  return Column(
    children: [
      Icon(icon,color: Colors.grey,),
      Text(txt,style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.bold),)
    ],
  );
}
Widget _bottomnav(){
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black12,
      items: [
        const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'Home'),
        const BottomNavigationBarItem(icon: Icon(Icons.people),label: 'My network'),
        const BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: 'Post'),
        const BottomNavigationBarItem(icon: Icon(Icons.notifications_active),label: 'Notification'),
        const BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag_fill),label: 'Jobs'),
      ],
  );
}