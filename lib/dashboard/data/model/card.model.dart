import 'package:json_annotation/json_annotation.dart';

part 'card.model.g.dart';

@JsonSerializable()
class CardModel {
  final String medName;
  final String time;
  final String? id;

  CardModel({required this.medName, required this.time, this.id});

  /// A necessary factory constructor for creating a new CardModel instance
  /// from a map. Pass the map to the generated `_$CardModelFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CardModel.
  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CardModelToJson`.
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
