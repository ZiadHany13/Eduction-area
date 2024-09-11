import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/doctor/details_course_doctor_screen.dart';
import 'package:i_learn/Screens/doctor/upload_course_screen.dart';
import 'package:i_learn/Screens/doctor/upload_lecture_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class CourseDoctorScreen extends StatefulWidget {
  final String semesterId;
  final String semesterName;
  const CourseDoctorScreen({super.key, required this.semesterId, required this.semesterName});

  @override
  State<CourseDoctorScreen> createState() => _CourseDoctorScreenState();
}

class _CourseDoctorScreenState extends State<CourseDoctorScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getCourse(id: widget.semesterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: Text(
          widget.semesterName,
          style: const TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: BlocConsumer<AppCubit,AppState>(
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Column(
            children: [
              const SizedBox(height: 30),
              (state is LoadingGetCourseState || state is LoadingDeleteCourseState)?
              const Center(child: CircularProgressIndicator()):
              Expanded(child: ListView.separated(
                itemCount: cubit.courseList.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemBuilder: (context,index){
                  return  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => DetailsCourseDoctorScreen(
                        courseId: cubit.courseList[index].id.toString(),
                        courseName: cubit.courseList[index].courseName??'',
                      )));
                    },
                    child: Container(
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,

                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: (){
                                  cubit.deleteCourse(courseId: cubit.courseList[index].id.toString());
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.delete,color: Colors.red,size: 30),
                                ),
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: cubit.courseList[index].courseCode??''));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.copy,color: Colors.black,size: 20),
                                ),
                              )
                            ],
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                Image.asset(height: 70, width: 70, 'Image/ook.png'),
                                const SizedBox(height: 10),
                                Text(
                                  cubit.courseList[index].courseName??'',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 40);
                },
              ),),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: Colors.blueAccent,
                    shadowColor: Colors.black),
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UploadCourseScreen(
                    idSemester: widget.semesterId,

                  )));

                },
                child: const Text(
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'BebasNeue',
                        color: Colors.black),
                    'Upload New Course'),
              ),
              const SizedBox(height: 20),





            ],
          );
        },
        listener: (context,state){
          if(state is LoadingDeleteCourseState){
            BlocProvider.of<AppCubit>(context).getCourse(id: widget.semesterId);
          }else if(state is ErrorDeleteCourseState){
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Error Delete Course')));
          }
        },
      ),
    );
  }
}
