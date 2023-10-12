import 'package:flutter/material.dart';
import 'package:maxrun_agency/notice/notice.dart';
void main() {
  runApp(const MaxRunDeskTopApp());
}

class MaxRunDeskTopApp extends StatefulWidget {
  const MaxRunDeskTopApp({super.key});

  @override
  State<MaxRunDeskTopApp> createState() => _MaxRunDeskTopAppState();
}

class _MaxRunDeskTopAppState extends State<MaxRunDeskTopApp> with SingleTickerProviderStateMixin{
  late TabController controller;
  
  @override
  void initState(){
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          toolbarHeight:10.0,
          //title: Text("MAXRUN"),
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(text: "공지사항"),
              Tab(text: "사진관리"),
              Tab(text: "환경설정"),
              Tab(text: "계정관리"),
              Tab(text: "담당자실적")
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Center(
              child: Notice(),
            ),
            Center(
              child: Text("TWO SCREEN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text("THREE SCREEN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text("FOUR SCREEN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text("FIVE SCREEN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TextPad',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const Scaffold(
//         body: Center(
//             child: Text('Hello World')
//         ),
//       ),
//     );
//   }
// }