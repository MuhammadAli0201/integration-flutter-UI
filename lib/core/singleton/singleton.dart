import 'package:slidable_button/slidable_button.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  factory Singleton() {
    return _singleton;
  }
  Singleton._internal();
  bool? isDark;
  var initialPosition = SlidableButtonPosition.start;
}
