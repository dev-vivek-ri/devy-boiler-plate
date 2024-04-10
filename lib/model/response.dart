
import 'package:devy_boiler_plate/model/meta_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class Response {
  Response({
    this.status,
    this.success,
    this.data,
    this.meta,
    this.result,
    this.token,
  });

  int? status;
  bool? success;
  dynamic data;
  MetaModel? meta;
  dynamic result;
  String? token;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
