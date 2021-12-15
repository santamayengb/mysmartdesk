part of 'card_cubit.dart';

class CardState extends Equatable {
  const CardState({required this.card});

  final List<CardModel> card;

  @override
  List<Object> get props => [card];
}
