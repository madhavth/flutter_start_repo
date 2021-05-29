// To parse this JSON data, do
//
//     final test = testFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'test.freezed.dart';
part 'test.g.dart';

@freezed
abstract class Test with _$Test {
  const factory Test({
    required int id,
    String? name,
  }) = _Test;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}
