import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/authentication/logic/authflow/authflow_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/dashboard/data/model/card.model.dart';
import 'package:mysmartdesk/dashboard/logic/card/card_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CardCubit>().state;
    final data = state.card;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: () => context.read<AuthflowCubit>().logout(),
              icon: const Icon(Icons.person))
        ],
      ),
      body: GridView.builder(
        itemCount: data.length,
        itemBuilder: itemBuilder,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          log(data.length.toString());
          context
              .read<CardCubit>()
              .add(CardModel(medName: "medName", time: "time"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
