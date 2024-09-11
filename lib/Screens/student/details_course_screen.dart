import 'package:flutter/material.dart';
import 'package:i_learn/Screens/student/assignment_upload_screen.dart';
import 'package:i_learn/Screens/student/materal_screen.dart';
import 'package:i_learn/Screens/student/practice_screen.dart';
import 'package:i_learn/Screens/student/show_assigment_screen.dart';


class DetailsCourseScreen extends StatefulWidget {
  final String courseName;
  final String courseId;
  const DetailsCourseScreen({Key? key, required this.courseName, required this.courseId}) : super(key: key);

  @override
  State<DetailsCourseScreen> createState() => _DetailsCourseScreenState();
}

class _DetailsCourseScreenState extends State<DetailsCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: Text( widget.courseName,
          style: const TextStyle(
              fontSize: 40, fontFamily: 'BebasNeue', color: Colors.white),
        ),
        leading: IconButton(
            iconSize: 30, onPressed: ()=>Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => MateralScreen(courseId: widget.courseId,courseName: widget.courseName,)));
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
                                height: 150, width: 150, 'Image/workshop.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Materal',
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
                            context, MaterialPageRoute(builder: (context) =>  PrecticeScreen(
                          courseName: widget.courseName,
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
                              'Practice',
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
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => AssignmentUploadScreen(courseId: widget.courseId,)));
                      },
                      child: Container(

                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Image.asset(
                                height: 150, width: 150, 'Image/workshop.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: const Text(
                                'Assignment Uploads',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'BebasNeue',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
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
                            context, MaterialPageRoute(builder: (context) =>  ShowAssignmentScreen(
                            courseId: widget.courseId,
                        )));
                      },
                      child: Container(
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
                              'Show Assignment',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
