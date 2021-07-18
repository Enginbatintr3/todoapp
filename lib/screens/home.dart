import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_x/db/db.dart';
import 'package:todo_x/models/todo.dart';
import 'package:todo_x/screens/add.dart';
import 'package:todo_x/utils/taskui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  width: 100,
                  height: 100,
                  image: AssetImage("assets/images/logo.png"),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Notes App | By Engin",
                  style: GoogleFonts.lato(
                      color: Colors.indigo,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: todos == null
                  ? Center(
                      child: Text(
                        "Please Add Note!",
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: count,
                      itemBuilder: (context, int position) {
                        return GestureDetector(
                          onTap: () {
                            navigateToDetail(todos[position]);
                          },
                          child: TaskCard(
                            label: todos[position].title,
                            text: todos[position].description,
                          ),
                        );
                      },
                    ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  navigateToDetail(Todo("", 3, ""));
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.indigo,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Add(todo)));
    if (result == true) {
      getData();
    }
  }

  void getData() {
    final todosFuture = helper.getTodos();
    todosFuture.then(
      (result) => {
        setState(() {
          todos = result;
          count = todos.length;
        })
      },
    );
  }
}
