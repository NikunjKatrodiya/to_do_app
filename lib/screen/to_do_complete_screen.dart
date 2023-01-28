import 'package:flutter/material.dart';

import '../data/constant.dart';

class ToDoCompleteScreen extends StatefulWidget {
  const ToDoCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ToDoCompleteScreen> createState() => _ToDoCompleteScreenState();
}

class _ToDoCompleteScreenState extends State<ToDoCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: listOfCompleteData.isEmpty
            ? const Text("No Data Found")
            : ListView.separated(
                itemBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                separatorBuilder: (context, index) {
                  final item = listOfCompleteData[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title : ${item.title}"),
                        Text("Time : ${item.time}"),
                        Text("Date : ${item.date}"),
                        Text("Description : ${item.description}"),
                      ],
                    ),
                  );
                },
                itemCount: listOfCompleteData.length,
              ),
      ),
    );
  }
}
