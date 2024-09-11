import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/student/confirm_new_course_screen.dart';
import 'package:i_learn/Screens/student/details_course_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class CourseStudentScreen extends StatefulWidget {
  final String semesterId;
  final String semesterName;
  const CourseStudentScreen({super.key, required this.semesterId, required this.semesterName,});

  @override
  State<CourseStudentScreen> createState() => _CourseStudentScreenState();
}

class _CourseStudentScreenState extends State<CourseStudentScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getCourseByStudent(idSemester: widget.semesterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.semesterName,
          style: const TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<AppCubit,AppState>(
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Column(
            children: [
              const SizedBox(height: 30),
              (state is LoadingGetCourseState)?
              const Center(child: CircularProgressIndicator()):
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.courseList.length,
                        itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => DetailsCourseScreen(
                            courseId: cubit.courseList[index].courseId.toString(),
                            courseName: cubit.courseList[index].courseName??'',
                          )));
                        },
                        child: Container(

                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              Image.asset(
                                  height: 120, width: 120, 'Image/ook.png'),
                              Text(
                                cubit.courseList[index].courseName??'',
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'BebasNeue',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: Colors.blueAccent,
                    shadowColor: Colors.black),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ConfirmNewCourseScreen(
                    idSemester: widget.semesterId,
                  )));

                },
                child: const Text(
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'BebasNeue',
                        color: Colors.black),
                    'Join New Course'),
              ),
              const SizedBox(height: 20),

            ],
          );
        },
      ),
    );
  }
}


