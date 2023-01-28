import 'package:flutter/material.dart';

import '../model/textfiled_common.dart';
import '../model/to_do_common.dart';

class ToDoAddScreen extends StatefulWidget {
  final ToDoModel? item;
  const ToDoAddScreen({Key? key, this.item}) : super(key: key);

  @override
  State<ToDoAddScreen> createState() => _ToDoAddScreenState();
}

class _ToDoAddScreenState extends State<ToDoAddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) {
      titleController.text = widget.item!.title!;
      timeController.text = widget.item!.time!;
      dateController.text = widget.item!.date!;
      descriptionController.text = widget.item!.description!;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Add"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextFiledCommon(
            controller: titleController,
            hintText: "Enter Title",
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              TimeOfDay? pickTime = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              timeController.text = pickTime!.format(context);

              setState(() {});
            },
            child: TextFiledCommon(
              controller: timeController,
              hintText: "Select Time",
              enabled: false,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              DateTime? pickDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
              dateController.text = pickDate.toString().split(" ").first;
            },
            child: TextFiledCommon(
              controller: dateController,
              hintText: "Select Date",
              enabled: false,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFiledCommon(
            minLines: 3,
            maxLines: 5,
            controller: descriptionController,
            hintText: "Enter Description",
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(double.infinity, 45),
              ),
            ),
            onPressed: () {
              ToDoModel toDoModel = ToDoModel(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
                description: descriptionController.text,
              );
              Navigator.pop(context, toDoModel);
            },
            child: const Text("Add List"),
          )
        ],
      ),
    );
  }
}
