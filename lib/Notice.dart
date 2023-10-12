void main() {
  getCoffee();
}

getCoffee() async {
  String menu = await todayCoffee();
  print("Today Coffee is $menu");
}

//쌍따옴표 사이에 $는 변수를 String으로 출력하기 위한 것이다.
//함수 속 변수를 출력하려면 ${Starbucks.coffee} 처럼 사용해야한다.


Future<String> todayCoffee() {
  return Future.delayed(Duration(seconds: 1), () => "Latte");
}

//=>의 표현은 람다(Lambda)식 이라고 읽는다.
//간단하게 return처럼 사용하면 되며, 자세한내용은 아래링크 참고
//https://khj93.tistory.com/entry/JAVA-%EB%9E%8C%EB%8B%A4%EC%8B%9DRambda%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B4%EA%B3%A0-%EC%82%AC%EC%9A%A9%EB%B2%95


//출력
//(1초 후)
//Today Coffee is Latte