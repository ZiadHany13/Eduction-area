
import 'package:flutter/material.dart';

import 'signin.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('Image/lib.jpg',fit: BoxFit.fill,
          width: double.infinity,height: double.infinity),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),

              ClipOval(
                  child: Image.asset('Image/sm.jpg',height: 150,width: 150,)),
              const SizedBox(height: 100,),
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
                  'Select Login'),
              const SizedBox(width: double.infinity,),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    shadowColor: Colors.black),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const SigninScreen(isStudent: true,);
                  }));
                },
                child: const Text(
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BebasNeue',
                        color: Colors.white),
                    'Login Student'),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    shadowColor: Colors.black),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const SigninScreen(isStudent: false,);
                  }));
                },
                child: const Text(
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'BebasNeue',
                        color: Colors.white),
                    'Login Doctor'),
              ),
              const Spacer(),

            ],
          ),
        ],
      ),
    );
  }
}
