import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Screens/home/home_screen.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     theme:ThemeData(
       scaffoldBackgroundColor: Colors.white,
       textTheme: GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          //change color of status bar
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity

     ),
     debugShowCheckedModeBanner: false,
     home: const HomeScreen(),
   );
  }
}
class HomePageScreen extends StatefulWidget{
  const HomePageScreen({Key? key}) : super(key: key);

  @override
 State createState()=>_HomePageState();

}
class _HomePageState extends State<HomePageScreen>{
   Future<AlbumModel>? futureAlbum;
  @override
  Widget build(BuildContext context){
    return  Scaffold(
    body:Center(
      child: FutureBuilder<AlbumModel>(
      future: _fetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a buttonr.
        return  TextButton(onPressed: ()async{
          await _fetchAlbum();
        },
            child: const Text('fetch Album',textAlign: TextAlign.center,)
        );
      },
    ),
    )/**/
    );
  }
 Future<AlbumModel> _fetchAlbum() async{
   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
   if (response.statusCode == 200) {
     if (kDebugMode) {
       print(AlbumModel.fromNahomJSON(jsonDecode(response.body)));
     }
     // If the server did return a 200 OK response,
     // then parse the JSON.
     return AlbumModel.fromNahomJSON(jsonDecode(response.body));
   } else {
     if (kDebugMode) {
       print('hey no');
     }
     // If the server did not return a 200 OK response,
     // then throw an exception.
     throw Exception('Failed to load album');
   }
  }
}
class AlbumModel{
  final int userId;
  final int id;
  final String title;
  const AlbumModel({required this.userId,required this.id,required this.title});
  // can also be factory Albumodl
  //we use factory as static method so and but name must be our class name(constructor)
  //fromNahomJons is named constructor
  //we return our consturocr and we call also return sub class constrouct
  factory AlbumModel.fromNahomJSON(Map<String,dynamic> json){
    //meaning that we have userId int key and got value from json['userId] from jsonDEcode
    //that means if we have error example userId is int and jsonDeconded value string it will become error
    return AlbumModel(userId: json['userId'], id: json['id'], title: json['title']);
  }
}
