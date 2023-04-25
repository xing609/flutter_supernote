import 'package:flutter_supernote/generated/json/base/json_field.dart';
import 'package:flutter_supernote/generated/json/base_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BaseEntity<T> {
	late bool? success;
	late String? errorCode;
	late String? errorMsg;
	late T? data;

	BaseEntity();

	factory BaseEntity.fromJson(Map<String, dynamic> json) => $BaseEntityEntityFromJson<T>(json);

	Map<String, dynamic> toJson() => $BaseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}