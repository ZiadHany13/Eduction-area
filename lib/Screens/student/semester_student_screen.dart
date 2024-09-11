import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/student/course_student_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class SemesterStudentScreen extends StatefulWidget {
  const SemesterStudentScreen({super.key});

  @override
  State<SemesterStudentScreen> createState() => _SemesterStudentScreenState();
}

class _SemesterStudentScreenState extends State<SemesterStudentScreen> {


  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getSemester(levelId: BlocProvider.of<AppCubit>(context).profileDoctor?.levelId.toString()??'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Teams',
          style: TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: ()=>Navigator.of(context).pop(), icon: Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<AppCubit,AppState>(
          builder: (context,state){
            var cubit =AppCubit.get(context);
        return Column(
          children: [
            const SizedBox(height: 20,),
            const Text(
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
                'Choose Your Team Divison'),
            const SizedBox(height: 40),
            (state is LoadingGetSemesterState)?
            const Center(child: CircularProgressIndicator()):Expanded(child:
            ListView.separated(
              itemCount: cubit.semesterList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CourseStudentScreen(semesterId: cubit.semesterList[index].id.toString(),semesterName: cubit.semesterList[index].semesterName??'',)));
                  },
                  child: Container(
                    height: 130,
                    width: 280,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        Image.asset(height: 70, width: 700, 'Image/class.png'),
                        Text(
                          cubit.semesterList[index].semesterName??'',
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
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 20);
              },
            ),)
          ],
        );
      })
    );
  }
}
