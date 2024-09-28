import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
// part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required int visibility,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      visibility: json['visibility'],
    );
  }
}
