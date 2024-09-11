import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class ConfirmNewCourseScreen extends StatelessWidget {
  final String idSemester;
  ConfirmNewCourseScreen({Key? key, required this.idSemester}) : super(key: key);

  TextEditingController uploadName=TextEditingController();
  GlobalKey<FormState> kForm =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Confirm New Course',
            style: TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.black54),
          ),
          backgroundColor: Colors.grey[700],
          leading: IconButton(
            iconSize: 30,
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocConsumer<AppCubit,AppState>(
          builder: (context,state){
            var cubit=AppCubit.get(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: kForm,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(color: Colors.blueAccent),
                      controller: uploadName,
                      decoration: InputDecoration(
                        labelText: 'Generated Course Code',
                        hintText: 'Generated Course Code',
                        hintStyle: const TextStyle(
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
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        labelStyle: const TextStyle(
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
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter data";
                        }
                      },
                    ),
                    const SizedBox(height: 20,),

                    (state is LoadingConfirmCodeState)?
                    const CircularProgressIndicator()
                        :ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          backgroundColor: Colors.blueAccent,
                          shadowColor: Colors.black),
                      onPressed: (){
                        if(kForm.currentState!.validate()){
                          cubit.confirmCode(
                            courseCode: uploadName.text,
                          );
                        }
                      },
                      child: const Text(
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'BebasNeue',
                              color: Colors.black),
                          'Join Course'),
                    ),


                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
          listener: (context,state){
            if(state is SuccessConfirmCodeState){
              Navigator.pop(context);
              BlocProvider.of<AppCubit>(context).getCourseByStudent(idSemester: idSemester);
            }else if (state is ErrorConfirmCodeState){
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Error Confirm Code')));
            }

          },
        )
    );
  }
}

