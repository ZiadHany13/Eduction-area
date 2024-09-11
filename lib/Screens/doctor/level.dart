import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/doctor/semester_doctor_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}


class _LevelScreenState extends State<LevelScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: const Text(
          'Level',
          style: TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: BlocBuilder<AppCubit,AppState>(
          builder: (context,state){
            var cubit =AppCubit.get(context);
            return Column(
              children: [
                const SizedBox(height: 40,),
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
                (state is LoadingGetLevelState)?
                const CircularProgressIndicator():Expanded(child:
                ListView.separated(
                  itemCount: cubit.listLevel.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context,index){
                    return  GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SemesterDoctorScreen(levelId: cubit.listLevel[index].id.toString(),levelName: cubit.listLevel[index].name??'',)));
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
                              cubit.listLevel[index].name??'',
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



