import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../StateManagement/provider1.dart';




class TodoCard extends StatefulWidget {
  TodoCard({
    Key? key,
    required this.taskCondition,required this.title, required this.index, required this.desc ,required this.priority
  }) : super(key: key);

  late bool taskCondition;
  late final String title;
  late final String? desc;
  late int index;
  late final int priority;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    DataStateProvider provider1 = Provider.of<DataStateProvider>(context);
    return Card(
      child: ListTile(

        leading:Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: widget.priority == 1 ? Colors.greenAccent : widget.priority == 2 ?  Colors.orangeAccent : Colors.redAccent,
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        title: Text(widget.title,style: TextStyle(
          color: Colors.black54
        ),),
        subtitle: Text(widget.desc ?? "Dont forget to do it"),
        trailing: Checkbox(
          onChanged: (val){
            setState((){
              widget.taskCondition = val!;
              if(val){
                provider1.completeTask(widget.index);
              }
            });

          }, value: widget.taskCondition,
        ),
      ),
    );
  }
}