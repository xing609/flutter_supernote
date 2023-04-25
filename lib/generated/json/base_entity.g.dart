import 'package:flutter_supernote/generated/json/base/json_convert_content.dart';
import 'package:flutter_supernote/models/base_entity.dart';
import 'package:logger/logger.dart';

import '../../utils/log_utils.dart';

BaseEntity<T> $BaseEntityEntityFromJson<T>(Map<String, dynamic> json) {
  final BaseEntity<T> baseEntityEntity = BaseEntity<T>();
  var data = jsonConvert.convert<dynamic>(json['data']) ?? null;
  if (data == null) {
    baseEntityEntity.data = null;
    LogE("获取到的data is null");
  } else {
    baseEntityEntity.data = data;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    baseEntityEntity.success = success;
  }
  final String? errorCode = jsonConvert.convert<String>(json['errorCode']);
  if (errorCode != null) {
    baseEntityEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    baseEntityEntity.errorMsg = errorMsg;
  }
  return baseEntityEntity;
}

Map<String, dynamic> $BaseEntityToJson(BaseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data;
  data['success'] = entity.success;
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}
