import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:todo_app/shared/components/constants.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();


  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is AppInsertDatabaseStates){
            Navigator.pop(context);
          }
        },
        builder: (context , state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is !AppGetDatabaseLoadingStates,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                if(cubit.isBottomSheetShown){
                  if(formKey.currentState!.validate()){
                    cubit.insertToDatabase(title: titleController.text, time:timeController.text, date: dateController.text);
                    // insertToDatabase(
                    //     date: dateController.text,
                    //     time: timeController.text,
                    //     title: titleController.text
                    // ).then((value){
                    //   getDataFromDatabase(database).then((value){
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //     //   tasks = value;
                    //     //   isBottomSheetShown =false;
                    //     //   fabIcon  =Icons.edit;
                    //     // });
                    //     print(tasks);
                    //   });
                    //
                    // });
                  }
                }else{
                  scaffoldKey.currentState!.showBottomSheet((context){
                    return Container(
                      color: Colors.grey[100],
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key:formKey ,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text("Task Title"),
                                prefix: Icon(Icons.title_outlined),
                                contentPadding: EdgeInsets.all(10),
                              ),

                              controller: titleController,
                              keyboardType: TextInputType.text,
                              validator: (value){
                                if(value == ''){
                                  return'must not be empty';
                                }
                                return null;
                              },
                              onTap: (){

                              },


                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text("Task Time"),
                                prefix: Icon(Icons.watch_later_outlined),
                                contentPadding: EdgeInsets.all(10),
                              ),
                              controller: timeController,
                              keyboardType: TextInputType.datetime,
                              validator: (value){
                                if(value == ''){
                                  return'must not be empty';
                                }
                                return null;
                              },
                              onTap: (){
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()).then((value){
                                  timeController.text = value!.format(context).toString();
                                });
                              },


                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text("Task Date"),
                                prefix: Icon(Icons.calendar_today_outlined),
                                contentPadding: EdgeInsets.all(10),
                              ),
                              controller: dateController,
                              keyboardType: TextInputType.datetime,
                              validator: (value){
                                if(value == ''){
                                  return'must not be empty';
                                }
                                return null;
                              },
                              onTap: (){
                                showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    initialDate: DateTime.now(),
                                    lastDate: DateTime.parse('2025-05-03')
                                ).then((value){
                                  // intl package to format date
                                  print(DateFormat.yMMMd().format(value!));
                                  dateController.text = DateFormat.yMMMd().format(value);
                                });
                              },


                            ),
                          ],
                        ),
                      ),
                    );
                  }).closed.then((value){
                    cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }

                // insertToDatabase();

              },
              child: Icon(
                  cubit.fabIcon
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 50,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
                // setState(() {currentIndex = index;});
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.add_task_outlined),label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: 'Done'),
                BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: 'Archived'),
              ],
            ),

          );
        },
      ),
    );
  }



}
