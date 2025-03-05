import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testaaaa/controller/Task2controller.dart';


class Task2 extends StatelessWidget {
  final Task2controller controller = Get.put(Task2controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.inputController,
              decoration: InputDecoration(hintText: "Enter a deatails"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.save_Note,
              child: Text("Save"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.notes[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => controller.editNoteDialog(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => controller.deleteNote(index),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
