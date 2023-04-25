

///convert和FlutterJsonBeanFactory结合解析
// class BaseEntity<T> {
//   T data;
//   int errorCode;
//   String errorMsg;
//
//   BaseEntity({this.data, this.errorCode, this.errorMsg});
//
//   BaseEntity.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null&&json['data']!='null') {
//       data = JsonConvert.fromJsonAsT<T>(json['data']);
//     }
//     errorCode = json['errorCode'];
//     errorMsg = json['errorMsg'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data;
//     }
//     data['errorCode'] = this.errorCode;
//     data['errorMsg'] = this.errorMsg;
//     return data;
//   }
// }












// import 'package:json_annotation/json_annotation.dart';
// part 'person_model.g.dart';
// /// 请求返回数据基类
// @JsonSerializable()
// class BaseModel<T> {
//   @JsonKey(name: 'data')
//   T? data;
//   @JsonKey(name: 'success')
//   bool? success;
//   @JsonKey(name: 'error_code')
//   String? errorCode;
//   @JsonKey(name: 'error_msg')
//   String? errorMsg;
//
//   BaseModel(this.data, this.success, this.errorCode, this.errorMsg);
//
//   factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$BaseModelToJson(this);
//
// }
