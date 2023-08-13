import 'package:flutter/material.dart';

class modelButton extends StatelessWidget {
  modelButton({
    Key? key,
    required this.addTask
  }) : super(key: key);
  final Function addTask;
  TextEditingController controller = TextEditingController();
  void handleonclick(BuildContext context) {
    final name = controller.text;
    if(name.isEmpty){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: Text("Thông báo!")),
          content: Text("Nhập công việc đi thằng ngu!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Dạ Em Đã Hiểu"),
            )
          ],
        ),
      );
      return;
    }
    // print(controller.text);
    addTask(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          // color: Color.fromARGB(255, 245, 154, 184),
          child: Column(
            children: [
              Text("Thêm công việc mới"),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập công việc của bạn',
                  hintText: "Nhập công việc",
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => handleonclick(context),
                  child: Text("Thêm công việc")),
            ],
          ),
        ),
      ),
    );
  }
}
