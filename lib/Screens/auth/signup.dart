
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';


class SignupScreen extends StatefulWidget {
  final bool isStudent;
  const SignupScreen({super.key, required this.isStudent});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController number = TextEditingController();
  GlobalKey<FormState> kForm = GlobalKey<FormState>();


  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
    fname.dispose();
    lname.dispose();
    number.dispose();
  }

  String ? level;

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getLevel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: BlocConsumer<AppCubit , AppState>(
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: const AssetImage('Image/libb.jpg')),
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
                        'SignUp ${widget.isStudent ?'Student' : 'Doctor'}',
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
                            fontSize: 40,
                            fontFamily: 'Pacifico',
                            color: Colors.white),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          'Enter Email And Password To Signup'),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueAccent),
                        controller: fname,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter Your Full Name',
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
                          prefixIcon: const Icon(Iconsax.card,
                              color: Colors.white, size: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          floatingLabelStyle: const TextStyle(
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
                            fontSize: 18,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Valid Name";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueAccent),
                        controller: lname,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          hintText: 'Enter Your User Name',
                          hintStyle: const TextStyle(
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
                          prefixIcon: const Icon(Iconsax.card,
                              color: Colors.white, size: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          floatingLabelStyle: const TextStyle(
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
                            fontSize: 18,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Valid Name";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueAccent),
                        controller: number,
                        decoration: InputDecoration(
                          labelText: 'Phone-Number',
                          hintText: 'Enter Phone-Number',
                          hintStyle: const TextStyle(
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
                          prefixIcon: const Icon(Iconsax.mobile,
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
                                color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Your Phone Number";
                          }

                          bool emailValid =
                          RegExp(r"^\d+$").hasMatch(value);

                          if (!emailValid) {
                            return "Enter Vaild Phone Number";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueAccent),
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Your E-mail',
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
                            return "Enter Valid E-mail Must Contain(Example@garagy.com)";
                          }

                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);

                          if (!emailValid) {
                            return "Enter Vaild Email";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        style: const TextStyle(color: Colors.blueAccent),
                        controller: passcontroller,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
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
                          } else if (value!.length < 6) {
                            return "Password Must Be More 6 Characters";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      (widget.isStudent) ?
                      (state is LoadingGetLevelState)?
                      const CircularProgressIndicator():
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Level',
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
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        value: level,
                        dropdownColor: Colors.black,
                        items: [
                         ...cubit.listLevel.map((e){
                           return DropdownMenuItem(
                             value: e.id.toString()??'',
                             child: Text(e.name??'',style: const TextStyle(
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
                             ),),
                           );
                         }),
                        ],
                        onChanged: (val){
                          level=val;
                        },
                      ):Container(),

                      const SizedBox(height: 30),

                      (state is LoadingSignUpState)
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 50),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            shadowColor: Colors.black),
                        onPressed: (){
                          if(kForm.currentState!.validate()){
                            if(widget.isStudent && level!=null){
                              cubit.signUpStudent(
                                  email: emailcontroller.text,
                                  password: passcontroller.text,
                                  phone: number.text,
                                  levelId: level!,
                                  userName: lname.text,
                                  fullName: fname.text);
                            }else{
                              cubit.signUpDoctor(email: emailcontroller.text,
                                  password: passcontroller.text,
                                  phone: number.text,
                                  userName: lname.text,
                                  fullName: fname.text);
                            }

                          }
                        },
                        child: Text(
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'BebasNeue',
                                color: Colors.black),
                            'Sign UP'),
                      ),


                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 50),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            shadowColor: Colors.black),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'BebasNeue',
                                color: Colors.black),
                            'BACK'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        listener: (context,state){
          if(state is SuccessSignUpState){
            Navigator.pop(context);
          }else if (state is ErrorSignUpState){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${'Error Login'}')));
          }
        },
      )
    );
  }
}
