// main.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main(){
  runApp(Notice());
}

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        // theme: ThemeData(
        //   primarySwatch: Colors.amber,
        // ),
        home: const NoticeList());
  }
}

class NoticeList extends StatefulWidget {
  const NoticeList({Key? key}) : super(key: key);

  @override
  State<NoticeList> createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  final DataTableSource _data = MyData();
  final TextEditingController  fromCtrl= TextEditingController();
  final TextEditingController  toCtrl= TextEditingController();

  DateTime? picked;

  Future datPicker() async{
    picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2010),
    lastDate: DateTime(2030));

    // if(picked != null) setState(() {
    //   fromDate = picked;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: InputDecoration( label: Text("from:")),
                  onTap: () async{
                    await datPicker();
                    if(picked!=null )
                      fromCtrl.text=DateFormat("yyyy년MM월dd일").format(picked!);
                  },
                  controller: fromCtrl,
                ),
              ),
              SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                    label: Text("to:")),
                    onTap:() async {
                      await datPicker();
                      if(picked!=null )
                        toCtrl.text = DateFormat("yyyy년MM월dd일").format(picked!);
                    },
                    controller: toCtrl,
                  )
              ),
              ElevatedButton(onPressed: (){}, child: Text("조회")),
              Spacer(),
              ElevatedButton(onPressed: (){}, child: Text("글쓰기"))
              //ElevatedButton(onPressed: datPicker, child: Text("20231011"))
            ],
          ),
          PaginatedDataTable(
            source: _data,
            //header: const Text('My Products'),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price'))
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 8,
            showCheckboxColumn: false,
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Kindacode.com'),
    //   ),
    //   body: ListView(
    //     children: [
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       PaginatedDataTable(
    //         source: _data,
    //         header: const Text('My Products'),
    //         columns: const [
    //           DataColumn(label: Text('ID')),
    //           DataColumn(label: Text('Name')),
    //           DataColumn(label: Text('Price'))
    //         ],
    //         columnSpacing: 100,
    //         horizontalMargin: 10,
    //         rowsPerPage: 8,
    //         showCheckboxColumn: false,
    //       ),
    //     ],
    //   ),
    // );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
          (index) => {
        "id": index,
        "title": "Item $index",
        "price": Random().nextInt(10000)
      });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
        onSelectChanged: (selected){
          print("row selected");
        },
        cells: [
          DataCell(Text(_data[index]['id'].toString())),
          DataCell(Text(_data[index]["title"])),
          DataCell(Text(_data[index]["price"].toString())),
        ]);
  }
}