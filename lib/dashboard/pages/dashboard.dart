import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/authentication/logic/authflow/authflow_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/dashboard/data/model/card.model.dart';

import 'package:mysmartdesk/dashboard/logic/card/card_cubit.dart';
import 'package:mysmartdesk/dashboard/widgets/medname_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final nameController = TextEditingController();

  String data = "";

  checkForIntialMessage() async {
    RemoteMessage? initailMsg =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initailMsg != null) {}
  }

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage();
    checkForIntialMessage();
    FirebaseMessaging.onMessage.listen((msg) {
      if (msg.notification != null) {
        log(msg.notification!.body.toString());
        setState(() {
          data = msg.notification!.body.toString();
        });
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((_msg) {
      String msg = _msg.data["route"];

      switch (msg) {
        case "Extra":
      }
    });
  }

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
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final d = data[index];

          return ListTile(
            title: Text(d.medName),
            subtitle: Text(d.time),
            onLongPress: () => context.read<CardCubit>().delete(d),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 250,
                    color: kPrimaryColor,
                    child: Column(
                      children: [
                        MedNameWidget(
                          nameController: nameController,
                        ),
                        TextButton(
                            onPressed: () {
                              context.read<CardCubit>().add(CardModel(
                                  medName: nameController.text, time: "time"));
                            },
                            child: const Text("Okay"))
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
