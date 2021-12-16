import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mysmartdesk/dashboard/data/model/card.model.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(FirebaseFirestore firebaseFirestore)
      : super(const CardState(card: [])) {
    // _firebaseFirestore = firebaseFirestore;
    cardCollection = firebaseFirestore.collection("cards");
    cardCollection.snapshots().listen((event) {
      final docs = event.docs;
      final mapOfDocs = docs.map((doc) {
        final id = doc.id;

        final cardMap = {
          ...doc.data(),
          "id": id,
        };
        return CardModel.fromJson(cardMap);
      }).toList();

      log(mapOfDocs.length.toString());
      emit(CardState(card: [...mapOfDocs]));
    });
  }

  late final CollectionReference<Map<String, dynamic>> cardCollection;
  // late final FirebaseFirestore _firebaseFirestore;

  Future<void> add(CardModel card) async {
    cardCollection.add(card.toJson());
  }

  Future<void> delete(CardModel card) async {
    await cardCollection.doc(card.id).delete();
  }
}
