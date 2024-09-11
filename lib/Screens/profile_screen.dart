
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';
import 'package:i_learn/services/shared_pref_services.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileUserScreen> {


  @override
  void initState() {
    if(SharedPref.getDate(key: 'kAccountStudent')??false){
      BlocProvider.of<AppCubit>(context).getProfileStudent();
    }else{
      BlocProvider.of<AppCubit>(context).getProfileDoctor();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: const Text('Profile',
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
          return (state is LoadingGetProfileState)?
          const Center(child: CircularProgressIndicator(),):
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                SafeArea(
                  child: Center(
                    child: Image.asset(
                      'Image/pro.png',
                      height: 150,
                      width: 150,
                      fit:  BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Email : ',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(cubit.profileDoctor?.email??'',
                        style: const TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Full Name : ',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(cubit.profileDoctor?.fullName??'',
                        style: const TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(
                      child: Text('User Name : ',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(cubit.profileDoctor?.userName??'',
                        style: const TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Phone Number : ',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: Text(cubit.profileDoctor?.phone??'',
                        style: const TextStyle(
                          color:Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          );
        },
      ),
    );
  }
}
