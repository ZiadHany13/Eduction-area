
import 'package:flutter/material.dart';
import 'package:i_learn/Screens/doctor/all_assignment_screen.dart';
import 'package:i_learn/Screens/doctor/upload_lecture_screen.dart';


class DetailsCourseDoctorScreen extends StatefulWidget {
  final String courseName;
  final String courseId;
  const DetailsCourseDoctorScreen({Key? key, required this.courseName, required this.courseId}) : super(key: key);

  @override
  State<DetailsCourseDoctorScreen> createState() => _DetailsCourseDoctorScreenState();
}

class _DetailsCourseDoctorScreenState extends State<DetailsCourseDoctorScreen> {
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
                            context, MaterialPageRoute(builder: (context) => UploadLectureScreen(
                          courseId: widget.courseId,
                          courseName: widget.courseName,
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
                                height: 150, width: 150, 'Image/workshop.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Upload Material',
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
                  ),

                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>  ShowAllAssignmentScreen(
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
                              'All Assignment',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
