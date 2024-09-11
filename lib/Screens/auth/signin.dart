
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:i_learn/Screens/doctor/doctor_home_screen.dart';
import 'package:i_learn/Screens/auth/signup.dart';
import 'package:i_learn/Screens/student/student_home_screen.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';


class SigninScreen extends StatefulWidget {
  final bool isStudent;
  const SigninScreen({super.key, required this.isStudent});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  GlobalKey<FormState> kForm=GlobalKey<FormState>();

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        builder: (context,state){
          var cubit = AppCubit.get(context);
      return Scaffold(
        body: Stack(
          children: [

            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: const AssetImage('Image/lib.jpg')),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: kForm,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    ClipOval(

                        child: Image.asset('Image/sm.jpg',height: 150,width: 150,)),
                    
                    
                    const SizedBox(height: 20),
                     Text(
                      'Login with ${widget.isStudent?'Student' : 'Doctor'}',
                      style: const TextStyle(
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
                          fontSize: 30,
                          fontFamily: 'Pacifico',
                          color: Colors.white),
                    ),
                    const SizedBox(height: 40),
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
                            fontSize: 30,
                            fontWeight: FontWeight.w900),
                        'Enter Email And Password To Login'),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.redAccent),
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter Your User Name',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(Iconsax.personalcard,
                            color: Colors.white, size: 30),
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
                          return "Enter User name";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.redAccent),
                      controller: passcontroller,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(Iconsax.finger_scan,
                            color: Colors.white, size: 30),
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
                          return "Enter Password";
                        }
                      },
                    ),
                    const SizedBox(height: 40),


                    (state is LoadingLoginState)
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          shadowColor: Colors.black),
                      onPressed: (){
                        if(kForm.currentState!.validate()){
                          if(widget.isStudent){
                            cubit.loginStudent(email: emailcontroller.text,
                                password: passcontroller.text);
                          }else{
                            cubit.loginDoctor(email: emailcontroller.text,
                                password: passcontroller.text);
                          }
                        }
                      },
                      child: const Text(
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'BebasNeue',
                              color: Colors.black),
                          'Sign in'),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          shadowColor: Colors.black),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(
                          isStudent: widget.isStudent,
                        )));

                      },
                      child: const Text(
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'BebasNeue',
                              color: Colors.black),
                          'Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }, listener: (context,state){
          if(state is SuccessLoginState){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.isStudent ? StudentHomeScreen() : DoctorHomeScreen()),(route) => false,);
          }else if (state is ErrorLoginState){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${'Error Login'}')));
          }

    });
  }
}
