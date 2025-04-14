import 'package:flutter/material.dart';
import 'package:flutter_house/data.dart';
import 'package:flutter_house/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "다방",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
        )
      ),
      home: House(),
    );
  }
}

class House extends StatelessWidget {
  const House({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("다방",
        style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index){
          final room = rooms[index];
          
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)
                    =>Detail(room: room))
                );
              },
              leading: Image.asset(room.image, width: 70, fit: BoxFit.cover,),
              title: Text(room.title),
              subtitle: Text(room.content),
              trailing: Text("${room.price}원"),
            ),
          );
        },
      )
    );
  }
}
