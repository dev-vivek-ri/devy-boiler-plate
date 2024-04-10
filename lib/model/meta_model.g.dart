// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };
