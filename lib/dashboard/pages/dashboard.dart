import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysmartdesk/authentication/data/constant/kcolor.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: SizedBox(
            height: 200,
            width: 140,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      "https://images.pexels.com/photos/360622/pexels-photo-360622.jpeg?cs=srgb&dl=pexels-pietro-jeng-360622.jpg&fm=jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Medicine Name",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text("9:50 AM",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => log("message"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
