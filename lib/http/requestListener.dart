import 'package:flutter/material.dart';
import 'package:flutter_supernote/models/base_error.dart';

///网络请求监听
class RequestListener<T> {
  RequestListener({required this.onSuccessListener, required this.onErrorListener});

  //请求成功
  final ValueChanged<T> onSuccessListener;

  //请求失败
  final ValueChanged<BaseError> onErrorListener;

  void onSuccess(T t) {
    if (onSuccessListener != null) onSuccessListener(t);
  }

  void onError(BaseError error) {
    if (onErrorListener != null) onErrorListener(error);
  }
}