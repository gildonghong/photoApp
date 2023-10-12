import 'package:flutter/material.dart';
import 'car_list.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MAX RUN",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("MAX RUN"),
          centerTitle: true,
        ),
        body: SearchCar(),
      ),
    );
  }
}

class SearchCar extends StatefulWidget {
  const SearchCar({super.key});

  @override
  State<SearchCar> createState() => _SearchCarState();
}

class _SearchCarState extends State<SearchCar> {
  final _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText="";

  @override
  void initState(){
    super.initState();
    _filter.addListener(() {
      setState(() {
        _searchText  = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color:Colors.black,
            padding: EdgeInsets.fromLTRB(5,10,5,10),
            child: Row(
              children: [
                Expanded(
                  flex:6,
                  child: TextField(
                    inputFormatters: [],
                    focusNode: focusNode,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        prefixIcon: Icon( Icons.search,
                                          color:Colors.white60,
                                          size:20),
                        suffixIcon: focusNode.hasFocus ? IconButton(
                          icon: Icon(Icons.cancel, size: 20),
                          onPressed: (){
                            setState(() {
                              _filter.clear();
                              _searchText="";
                              focusNode.unfocus();
                            });
                          },):Container(),
                        hintText: "검색",
                        labelStyle: TextStyle( color: Colors.white)),
                  )),
              ],
            ),
          ),
          Expanded(child: CarList())
        ],
      ),
    );
  }
}
