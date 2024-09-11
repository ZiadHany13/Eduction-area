import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/doctor/course_doctor_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';


class SemesterDoctorScreen extends StatefulWidget {
  final String levelId;
  final String levelName;
  const SemesterDoctorScreen({super.key, required this.levelId, required this.levelName});

  @override
  State<SemesterDoctorScreen> createState() => _SemesterDoctorScreenState();
}


class _SemesterDoctorScreenState extends State<SemesterDoctorScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getSemester(levelId: widget.levelId);
    super.initState();
  }

  void back() {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          title:  Text(
            widget.levelName??'',
            style: const TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
          ),
          leading: IconButton(
              iconSize: 30, onPressed: back, icon: Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<AppCubit,AppState>(
            builder: (context,state){
              var cubit =AppCubit.get(context);
              return Column(
                children: [
                  const SizedBox(height: 40,),
                  const Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.white,
                                blurRadius: 40,
                                offset: Offset(4, 7)),
                            Shadow(
                                color: Colors.blueAccent,
                                blurRadius: 40,
                                offset: Offset(-4, -7)),
                          ],
                          color: Colors.white,
                          fontFamily: 'BebasNeue',
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                      'Choose Your semester Divison'),
                  const SizedBox(height: 40),
                  (state is LoadingGetSemesterState)?
                  const CircularProgressIndicator():Expanded(child:
                  ListView.separated(
                    itemCount: cubit.semesterList.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context,index){
                      return  GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CourseDoctorScreen(semesterId: cubit.semesterList[index].id.toString(),semesterName: cubit.semesterList[index].semesterName??'',)));
                        },
                        child: Container(
                          height: 130,
                          width: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,

                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              Image.asset(height: 70, width: 70, 'Image/class.png'),
                              Text(
                                cubit.semesterList[index].semesterName??'',
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Pacifico',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return const SizedBox(height: 40);
                    },
                  ),)
                ],
              );
            })
    );
  }
}
