import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  late User user = User();
  String? token;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
