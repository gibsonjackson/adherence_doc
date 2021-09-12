import 'package:meta/meta.dart';

class User {
  final int id;
  String name;
  final int points;

  User({
    @required this.id,
    @required this.name,
    @required this.points,
  });
}
