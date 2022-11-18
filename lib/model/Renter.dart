import 'package:json_annotation/json_annotation.dart';

part 'Renter.g.dart';

@JsonSerializable()
class Renter {
  String username = "";
  String password = "";
  String email = "";
  String phone = "";
  String fullName = "";
  String birthDate = "";
  String address = "";
  String gender = "";

  Renter(this.username, this.password, this.email, this.phone, this.fullName,
      this.birthDate, this.address, this.gender);
  factory Renter.fromJson(Map<String, dynamic> json) => _$RenterFromJson(json);
  Map<String, dynamic> toJson() => _$RenterToJson(this);
}
