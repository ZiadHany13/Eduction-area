
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/bloc/app_cubit.dart';
import 'package:i_learn/bloc/app_state.dart';


class PrecticeScreen extends StatelessWidget {
  final String courseName;
  const PrecticeScreen({Key? key, required this.courseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          title: const Text( 'Practice',
            style: TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.white),
          ),
          leading: IconButton(
              iconSize: 30, onPressed: ()=>Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>  DetailsPrecticeScreen(
                          courseName: courseName,
                          level: 'easy',
                        )));
                      },
                      child: Container(
                        height: 220,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Image.asset(
                                height: 150, width: 150, 'Image/bo.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Easy',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>  DetailsPrecticeScreen(
                          courseName: courseName,
                          level: 'middle',
                        )));

                      },
                      child: Container(
                        height: 220,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Image.asset(
                                height: 150, width: 150, 'Image/bo.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Middle',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>  DetailsPrecticeScreen(
                          courseName: courseName,
                          level: 'hard',
                        )));

                      },
                      child: Container(
                        height: 220,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 5),
                            Image.asset(
                                height: 150, width: 150, 'Image/bo.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Hard',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}


class DetailsPrecticeScreen extends StatefulWidget {
  final String level;
  final String courseName;
  const DetailsPrecticeScreen({Key? key, required this.level, required this.courseName}) : super(key: key);

  @override
  State<DetailsPrecticeScreen> createState() => _DetailsPrecticeScreenState();
}

class _DetailsPrecticeScreenState extends State<DetailsPrecticeScreen> {

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).chatPotAssignment(courseName: widget.courseName,level: widget.level);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          centerTitle: true,
          title: const Text( 'Assignment',
            style: TextStyle(
                fontSize: 40, fontFamily: 'BebasNeue', color: Colors.white),
          ),
          leading: IconButton(
              iconSize: 30, onPressed: ()=>Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
        ),
        body: BlocBuilder<AppCubit,AppState>(
          builder: (context,state){
            var cubit = AppCubit.get(context);
            return (state is LoadingChatPotAssignmentState)?
            const Center(child: CircularProgressIndicator(),):
            SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              physics: const BouncingScrollPhysics(),
              child: Text(
                cubit.chatPotAss??'',
                style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            );
          },
        )
    );
  }
}

