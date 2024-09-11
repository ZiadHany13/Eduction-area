

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';

class AddCommentScreen extends StatefulWidget {
  final String assignmentId;
  final String assignmentName;
  const AddCommentScreen({super.key, required this.assignmentId, required this.assignmentName});

  @override
  State<AddCommentScreen> createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {

  TextEditingController commentController=TextEditingController();

  GlobalKey<FormState> kForm =GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Comment',
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
                  Center(
                    child: Text(
                      widget.assignmentName??'',
                      style: const TextStyle(
                          fontSize: 50,
                          fontFamily: 'BebasNeue',
                          color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    style: const TextStyle(color: Colors.blueAccent),
                    controller: commentController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Add Comment',
                      hintText: 'Add Comment',
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
                  SizedBox(height: 50,),

                  (state is LoadingPutCommentAssignmentState)?
                  const CircularProgressIndicator()
                      :ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.black),
                    onPressed: (){
                      if(kForm.currentState!.validate()){
                        cubit.addCommentAssignment(
                            idAssignment: widget.assignmentId,
                            comment: commentController.text,
                        );
                      }
                    },
                    child: Text(
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'BebasNeue',
                            color: Colors.black),
                        'Upload Comment'),
                  ),


                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
        listener: (context,state){
          if(state is SuccessPutCommentAssignmentState){
            Navigator.pop(context);
          }else if (state is ErrorPutCommentAssignmentState){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${'Error'}')));
          }

        },
      )
  );
}
