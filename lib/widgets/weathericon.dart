import 'package:flutter/cupertino.dart';

Widget getweatherIcon(int cord) {
  switch (cord) {
    case >= 200 && < 300:
      return Image.asset('assets/1.png');
    case >= 300 && < 400:
      return Image.asset('assets/2.png');
    case >= 500 && < 600:
      return Image.asset('assets/3.png');
    case >= 600 && < 700:
      return Image.asset('assets/4.png');
    case >= 700 && < 800:
      return Image.asset('assets/5.png');
    case == 800:
      return Image.asset('assets/6.png');
    case > 800 && < 804:
      return Image.asset('assets/7.png');
    default:
      return Image.asset('assets/7.png');
  }
}
