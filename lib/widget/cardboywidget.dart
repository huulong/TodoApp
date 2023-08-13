import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
class cardbody extends StatelessWidget {
 cardbody({
    Key? key,
    required this.items,required this.deleteTask,
  }):super(key: key);
  var items;
final Function deleteTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
         color:  Color.fromARGB(255, 245, 154, 184),
         borderRadius: BorderRadius.circular(10),
      ),
         child:Padding(
          padding:EdgeInsets.symmetric(horizontal: 20),
           
         child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(items.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            InkWell(
              onTap: () async {
            if (await confirm(context)) {
             deleteTask(items.id);
            }
            return print('pressedCancel');
          },
              child: Icon(Icons.delete)),
          ],
         )
         )
      );
  }
}
