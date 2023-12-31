import 'package:freezed_annotation/freezed_annotation.dart';

part 'coord.freezed.dart';
part 'coord.g.dart';

@freezed
class Coord with _$Coord {
  factory Coord({
    double? lat,
    double? lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
