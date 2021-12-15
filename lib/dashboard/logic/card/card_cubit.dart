import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mysmartdesk/dashboard/data/model/card.model.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(FirebaseFirestore firebaseFirestore)
      : super(const CardState(card: [])) {
    firebaseFirestore = _firebaseFirestore;
    firebaseFirestore.collection("cards").snapshots().listen((event) {
      final docs = event.docs;
      final mapOfDocs = docs.map((doc) => Card.fromJson(doc.data())).toList();

      log(mapOfDocs.toString());
      emit(CardState(card: [...mapOfDocs]));
    });
  }

  late final FirebaseFirestore _firebaseFirestore;

  Future<void> add(Card card) async {
    _firebaseFirestore.collection("cards").add();
  }
}
