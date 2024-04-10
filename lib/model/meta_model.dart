
import 'package:devy_boiler_plate/model/pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel {
  MetaModel({
    this.pagination,
    
  });

  Pagination? pagination;
  

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
