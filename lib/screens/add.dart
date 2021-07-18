import 'package:flutter/material.dart';
import 'package:flutter_button/3d/3d_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_x/db/db.dart';
import 'package:todo_x/models/todo.dart';
import 'package:todo_x/utils/button3d.dart';
import 'package:todo_x/utils/field.dart';

class Add extends StatefulWidget {
  final Todo todo;

  const Add(this.todo);

  @override
  _AddState createState() => _AddState(todo);
}

class _AddState extends State<Add> {
  TextEditingController titlec = TextEditingController();
  TextEditingController note = TextEditingController();
  DbHelper helper = DbHelper();
  Todo todo;
  _AddState(this.todo);

  @override
  Widget build(BuildContext context) {
    titlec.text = todo.title;
    note.text = todo.description;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 100, top: 100, right: 80, left: 80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(.5),
                    offset: const Offset(10, 15),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add Your Note",
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  myMethod(titlec, "Enter Your Note Title"),
                  myMethod(note, "Enter Your Note"),
                  const SizedBox(
                    height: 15,
                  ),
                  Button3D(
                    style: styleofbutton(),
                    onPressed: () {
                      save();
                    },
                    child: const Center(
                      child: Text("Save"),
                    ),
                  ),
                  Button3D(
                    style: styleofbutton(),
                    onPressed: () {
                      delete();
                    },
                    child: const Center(
                      child: Text("Delete"),
                    ),
                  ),
                  Button3D(
                    style: styleofbutton(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text("Back"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void delete() async {
    Navigator.pop(context, true);
    if (todo.id == null) {
      return;
    }
    int result;
    result = await helper.deleteTodo(todo.id);
    if (result != 0) {
      AlertDialog alertDialog =
          alertDialogofDB("Delete Todo", "The Todo has been deleted");
      showDialog(context: context, builder: (_) => alertDialog);
    }
  }

  void save() {
    todo.title = titlec.text;
    todo.description = note.text;
    todo.date = DateFormat.yMd().format(DateTime.now());
    if (todo.id != null) {
      helper.updateTodo(todo);
    } else {
      helper.insertTodo(todo);
    }
    Navigator.pop(context, true);
    showAlert(todo.id != null);
  }

  void showAlert(bool isUpdate) {
    AlertDialog alertDialog;
    if (isUpdate) {
      alertDialog = alertDialogofDB("Update Todo", "The Todo has been updated");
    } else {
      alertDialog =
          alertDialogofDB("Insert Todo", "The Todo has been inserted");
    }
    showDialog(context: context, builder: (_) => alertDialog);
  }

  AlertDialog alertDialogofDB(String title, String desc) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(title),
      content: Text(desc),
    );
  }
}
