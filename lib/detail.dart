import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final dynamic room;

  const Detail({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room.title),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(room.image),
          SizedBox(height: 20),
          Text(
            room.content,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20,),
          Text(
            "가격 : ${room.price}원",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
      ),
    );
  }
}
