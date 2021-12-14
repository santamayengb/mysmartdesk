import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';
import 'package:mysmartdesk/authentication/logic/authflow/authflow_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysmartdesk/dashboard/logic/cubit/addnewmedicine_cubit.dart';
import 'package:mysmartdesk/dashboard/widgets/widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: GridView.count(
        crossAxisCount: 2,
        children: const [CardView(), CardView(), CardView(), CardView()],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () =>
            context.read<AddnewmedicineCubit>().addNew("asdasd", "sadasd"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
