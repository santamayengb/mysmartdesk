import 'package:json_annotation/json_annotation.dart';

part 'card.model.g.dart';

@JsonSerializable()
class Card {
  final String medName;
  final String time;

  Card({required this.medName, required this.time});

  /// A necessary factory constructor for creating a new Card instance
  /// from a map. Pass the map to the generated `_$CardFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Card.
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CardToJson`.
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
