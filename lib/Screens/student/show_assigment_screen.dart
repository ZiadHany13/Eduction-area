

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';
import 'package:url_launcher/url_launcher.dart';


class ShowAssignmentScreen extends StatefulWidget {
  final String courseId;
  const ShowAssignmentScreen({super.key, required this.courseId,});

  @override
  State<ShowAssignmentScreen> createState() => _ShowAssignmentScreenState();
}

class _ShowAssignmentScreenState extends State<ShowAssignmentScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getStudentAssignment(courseId: widget.courseId);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          title: const Text( 'Show Assignment',
            style: TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.white),
          ),
          leading: IconButton(
              iconSize: 30, onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<AppCubit,AppState>(
          builder: (context,state){
            var cubit=AppCubit.get(context);
            return (state is LoadingShowStudentAssignmentState)?
            const Center(child: CircularProgressIndicator())
                :ListView.builder(
                itemCount: cubit.assignmentList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cubit.assignmentList[index].assignmentName??''),
                    selected: true,
                    tileColor: Colors.grey,
                    trailing: IconButton(
                        onPressed: () async{
                          try{
                            await launch(cubit.assignmentList[index].assignmentUrl??'');
                          }catch(e){
                            debugPrint(e.toString());
                          }
                        },
                        icon: const Icon(Icons.link)),
                    leading: const Icon(Icons.my_library_books),
                    subtitle: Text(cubit.assignmentList[index].comment??''),
                  );
                });
          },
        )
    );
  }
}
