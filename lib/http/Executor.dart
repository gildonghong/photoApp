import 'dart:convert';

import 'package:http/http.dart' as http;

void main(){
  Map<String, dynamic> param = {"pageNo":1};
  Future<List<dynamic>> lst = getList(endPoint: "http://localhost/notice/list", param: param) as Future<List<dynamic>>;
}

Future<List<dynamic>> getList({ required String endPoint,
                                Map<String, dynamic>? param}) async {
  try {
    String queryString = _getQueryString(param);
    endPoint = endPoint + queryString;

    print("queyrString==>" + queryString);
    print("endPoint==>" + endPoint);

    http.Response _response = await http.get( Uri.parse(endPoint));
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      List<dynamic> _data = jsonDecode(_response.body);
      print("resultset===>");
      print(_data);
      return _data;
    } else {
      return [];
    }
  } catch (error) {
    print(error);
    return [];
  }
}

String _getQueryString(Map<String, dynamic>? param){
  String  queryString="";

  param?.forEach((key, value) {
    queryString = queryString==""?"?":queryString + "&";
    queryString += key + '=' + value.toString();
  });

  return queryString;
}