import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:testaaaa/Utils/Utils.dart';

class Task2controller extends GetxController {
  var notes = <String>[].obs;
  final TextEditingController inputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    load_Notes();
  }

  Future<void> load_Notes() async {
    final prefs = await SharedPreferences.getInstance();
    notes.value = prefs.getStringList('notes') ?? [];
  }

  Future<void> save_Note() async {
    final text = inputController.text.trim();
    if (text.isNotEmpty){
      notes.add(text);
      inputController.clear();
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('notes', notes);
    }else{
     Utils.toast("please add text");
    }

  }

  Future<void> deleteNote(int index) async {
    notes.removeAt(index);


    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notes);
  }

  void editNoteDialog(int index) {
    inputController.text = notes[index];


    Get.defaultDialog(
      title: "Edit",
      content: TextField(
        controller: inputController,
        autofocus: true,
      ),
      textCancel: "Cancel",
      textConfirm: "Save",
      onConfirm: () {
        updateNote(index);
        Get.back();
      },
    );
  }

  Future<void> updateNote(int index) async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    notes[index] = text;
    inputController.clear();

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notes);
  }
}
