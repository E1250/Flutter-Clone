import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

Widget buildTaskItem(Map model,context){
  return Dismissible(
    onDismissed: (direction){
      AppCubit.get(context).deleteData(id: model['id']);
    },
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text('${model['time']}'),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${model['title']}',style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),
                Text('${model['date']}',style: TextStyle(color: Colors.grey))

              ],
            ),
          ),
          IconButton(onPressed: (){
            AppCubit.get(context).updateData(status: "done", id: model['id']);
          }, icon: Icon(Icons.check_box_outlined,color: Colors.green,)),
          IconButton(onPressed: (){
            AppCubit.get(context).updateData(status: "archived", id: model['id']);
          }, icon: Icon(Icons.archive_outlined,color: Colors.black45,))

        ],
      ),
    ),
  );
}

Widget tasksBuilder ({required List<Map> tasks}) => ConditionalBuilder(
  fallback:(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,
            size: 100,
            color: Colors.grey,
          ),
          Text("No Tasks Yet ,Please add some taks",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),)
        ],
      ),
    );
  } ,
  condition: tasks.length>0,
  builder: (BuildContext context) {return ListView.separated(
      itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
      separatorBuilder: (context , index)=>Container(width:double.infinity ,
        height: 1,
        color: Colors.grey[300],
      ),
      itemCount:tasks.length);
  },


);