import 'package:json_annotation/json_annotation.dart';

part 'money_model.g.dart';

@JsonSerializable()
class MoneyModel {
  @JsonKey(name: "available_currencies")
  final Map<String, String> availableCurrencies;
  MoneyModel({required this.availableCurrencies});

  factory MoneyModel.fromJson(Map<String, dynamic> json) =>
      _$MoneyModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyModelToJson(this);
}
