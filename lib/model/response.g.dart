// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      status: json['status'] as int?,
      success: json['success'] as bool?,
      data: json['data'],
      meta: json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      result: json['result'],
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': instance.data,
      'meta': instance.meta,
      'result': instance.result,
      'token': instance.token,
    };
