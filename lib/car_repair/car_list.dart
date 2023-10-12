import 'package:flutter/material.dart';

class CarList extends StatelessWidget {
  CarList({super.key});

  List<String> city = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '세종시', '인천시2', '부산시2', '대구시2', '대전시2', '광주시2', '울산시2', '세종시2'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: city.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(city[index]),
                  Image.asset('images/carimg.PNG')
                ],
              ),
            );
          }),
    );
  }
}

class SearchedList extends StatefulWidget {
  const SearchedList({super.key});

  @override
  State<SearchedList> createState() => _SearchedListState();
}

class _SearchedListState extends State<SearchedList> {

  Stream<String> getList(){
    return Stream.fromIterable(city);
  }

  List<String> city = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '세종시', '인천시2', '부산시2', '대구시2', '대전시2', '광주시2', '울산시2', '세종시2'];

  @override
  void initState(){
    city = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '세종시', '인천시2', '부산시2', '대구시2', '대전시2', '광주시2', '울산시2', '세종시2'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: city.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(city[index]),
                  Image.asset('images/big.jpeg')
                ],
              ),
            );
          }),
    );
  }
}

