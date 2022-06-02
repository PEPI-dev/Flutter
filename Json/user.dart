import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';



class User {
  final String name;
  final String email;
  final String createdTime;

  User(this.name, this.email, this.createdTime);

 factory User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);
 

  Map<String, dynamic> toJson() => _$UserFromJson(this);
}

class _$UserFromJson {
}

