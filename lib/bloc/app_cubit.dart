
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_learn/Screens/student/chat_bot_screen.dart';
import 'package:i_learn/bloc/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:i_learn/model/login_model.dart';
import 'package:i_learn/model/model.dart';
import 'package:i_learn/services/shared_pref_services.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  final String baseUrl= 'http://smartlearn.somee.com';

  Map<String , String > header={
    'Accept':'application/json',
    'Content-Type':'application/json',
    // 'authorization':'Basic ${base64Encode(utf8.encode('11163458:60-dayfreetrial'))}'
  };

  void loginStudent({required String email , required String password})async{
    emit(LoadingLoginState());
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Auth/StudentLogin'),
          body: json.encode({
            'userName':email,
            'password':password
          }),headers:header );
      Map<String, dynamic> data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200){
        LoginModel loginModel = LoginModel.jsonData(data);
        SharedPref.setDate(key: 'kLogin',value:  true);
        SharedPref.setDate(key: 'kAccountStudent',value:  true);
        SharedPref.setDate(key: 'kIdAccount',value:  loginModel.userId.toString());
        emit(SuccessLoginState());
      }else{
        emit(ErrorLoginState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorLoginState());
    }
  }

  void loginDoctor({required String email , required String password})async{
    emit(LoadingLoginState());
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Auth/DoctorLogin'),
          body: json.encode({
            'userName':email,
            'password':password
          }),headers:header );
      var data = jsonDecode(response.body);
      print(response.statusCode);

      if(response.statusCode==200 || response.statusCode==201){
        LoginModel loginModel = LoginModel.jsonData(data);
        SharedPref.setDate(key: 'kLogin',value:  true);
        SharedPref.setDate(key: 'kAccountStudent',value:  false);
        SharedPref.setDate(key: 'kIdAccount',value:  loginModel.userId.toString());
        emit(SuccessLoginState());
      }else{
        emit(ErrorLoginState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorLoginState());
    }
  }


  List<LevelModel> listLevel=[];
  void getLevel()async{
    emit(LoadingGetLevelState());
    listLevel=[];
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/levels'),
          headers:header);
      dynamic data = jsonDecode(response.body);
      if(response.statusCode==200){
        for(int i=0; i < data.length; i++){
          listLevel.add(LevelModel.jsonData(data[i]));
        }
        emit(SuccessGetLevelState());
      }
    }catch(e){
      emit(ErrorGetLevelState());
    }
  }

  void signUpDoctor({required String email , required String password , required String phone , required String userName , required String fullName})async{
    emit(LoadingSignUpState());
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Auth/DoctorRegister'),
          body: json.encode({
            'userName':userName,
            'fullName':fullName,
            'email':email,
            'phone':phone,
            'password':password,
          }),headers:header);
      print('ff');
      if(response.body.isNotEmpty){
        var data = jsonDecode(response.body);
      }
      print(response.statusCode);

      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessSignUpState());
      }else{
        emit(ErrorSignUpState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorSignUpState());
    }
  }

  void signUpStudent({required String email , required String password , required String phone , required String userName , required String fullName  , required String levelId})async{
    emit(LoadingSignUpState());
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Auth/StudentRegister'),
          body: json.encode({
            'userName':userName,
            'fullName':fullName,
            'email':email,
            'phone':phone,
            'password':password,
            'levelId':'$levelId'
          }),headers:header );
      print('ff');
      if(response.body.isNotEmpty){
        var data = jsonDecode(response.body);
      }
      print(response.statusCode);

      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessSignUpState());
      }else{
        emit(ErrorSignUpState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorSignUpState());
    }
  }

  List<SemesterModel> semesterList=[];

  void getSemester({required String levelId})async{
    emit(LoadingGetSemesterState());
    semesterList=[];
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Semester/GetSemesterByLevelId/$levelId'),
      headers:header );
      dynamic data = jsonDecode(response.body);
      if(response.statusCode==200){
        for(int i=0; i < data.length; i++){
          semesterList.add(SemesterModel.jsonDate(data[i]));
        }
        emit(SuccessGetSemesterState());
      }
    }catch(e){
      emit(ErrorGetSemesterState());
    }
  }

  List<SemesterModel> courseList=[];


  void getCourse({required String id})async{
    emit(LoadingGetCourseState());
    courseList=[];
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Courses/GetCourseBySemesterId/$id'),
          headers:header );
      dynamic data = jsonDecode(response.body);
      if(response.statusCode==200){
        for(int i=0; i < data.length; i++){
          courseList.add(SemesterModel.jsonDate(data[i]));
        }
        emit(SuccessGetCourseState());
      }
    }catch(e){
      emit(ErrorGetCourseState());
    }
  }


  void getCourseByStudent({required String idSemester})async{
    emit(LoadingGetCourseState());
    courseList=[];
    String idAccount = SharedPref.getDate(key: 'kIdAccount')??'';

    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Students/GetCoursesByStudent').replace(
          queryParameters: {
            'studentId':idAccount
          }
      ),
          headers:header);
      dynamic data = jsonDecode(response.body);
      if(response.statusCode==200){
        for (var element in data) {
          if(element['semesterId'] == int.parse(idSemester)){
           courseList.add(SemesterModel.jsonDate(element));
          }
        }
        emit(SuccessGetCourseState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorGetCourseState());
    }
  }

  List<SubjectModel> subList=[];

  void getSubject({required String id})async{
    emit(LoadingGetSubjectState());
    subList=[];

    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Uploads/GetUploadsByCourseID/$id'),
          headers:header );
      dynamic data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200){
        for(int i=0; i < data.length; i++){
          subList.add(SubjectModel.jsonData(data[i]));
        }
        emit(SuccessGetSubjectState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorGetSubjectState());
    }
  }

  void uploadSubject({required String uploadName , required String fileUrl , required String courseId})async{
    emit(LoadingUploadState());
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Uploads'.trim()),
          body: json.encode({
            'UploadName': uploadName,
            'FileUrl':fileUrl,
            'CourseId':'${int.parse(courseId)}',
          }),headers:header );
      Map<String, dynamic> data = jsonDecode(response.body);
      if(response.statusCode==200){
        emit(SuccessUploadState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorUploadState());
    }
  }

  List <ChatModel> listChat= [];

  void clearChat(){
    listChat=[];
    emit(AnyAppState());
  }

  void addChat(String msg){
    listChat.add(ChatModel(
      isOwner: true,
      msg: msg
    ));
    emit(AnyAppState());
  }

  void chatBot({required String msg ,})async{
    emit(LoadingChatState());
    print(msg);
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/ChatPot'),
          body: json.encode({
            'promptStr': msg,
          }),headers:header );
      String data = jsonDecode(response.body);
      print(data);
      if(response.statusCode==200){
        listChat.add(ChatModel(
          isOwner: false,
          msg: data
        ));
        emit(SuccessChatState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorChatState());
    }
  }


  String ? chatPotAss;
  void chatPotAssignment({required String courseName ,required String level})async{
    emit(LoadingChatPotAssignmentState());
    chatPotAss='';
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/ChatPot/Assignment'),
          body: json.encode({
            'courseName': courseName,
            'level': level,
            'noOfQuestions': 10,
          }),headers:header );
      String data = jsonDecode(response.body);
      print(data);
      if(response.statusCode==200){
        chatPotAss=data;
        emit(SuccessChatPotAssignmentState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorChatPotAssignmentState());
    }
  }


  ProfileDoctor ? profileDoctor;
  void getProfileDoctor()async{
    emit(LoadingGetProfileState());
    profileDoctor=null;
    String id = SharedPref.getDate(key: 'kIdAccount');
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Auth/GetDoctorById/$id',),
          headers:header );
      Map<String, dynamic> data = jsonDecode(response.body);
      if(response.statusCode==200){
        profileDoctor = ProfileDoctor.jsonData(data);
        emit(SuccessGetProfileState());
      }else{
        emit(ErrorGetProfileState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorGetProfileState());
    }
  }

  void getProfileStudent()async{
    emit(LoadingGetProfileState());
    profileDoctor=null;
    String id = SharedPref.getDate(key: 'kIdAccount');
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Auth/GetStudentById/$id',),
          headers:header );
      var data = jsonDecode(response.body);
      if(response.statusCode==200){
        profileDoctor = ProfileDoctor.jsonData(data[0]);
        emit(SuccessGetProfileState());
      }else{
        emit(ErrorGetProfileState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorGetProfileState());
    }
  }

  void uploadCourse({required String courseName ,required String semesterId})async{
    emit(LoadingUploadCourseState());
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Courses',),
          body:   json.encode({
            'courseName': courseName,
            'semesterId': '$semesterId'
          }),
          headers:header );
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessUploadCourseState());
        getCourse(id: semesterId);
      }else{
        emit(ErrorUploadCourseState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorUploadCourseState());
    }
  }

  void deleteCourse({required String courseId})async{
    emit(LoadingDeleteCourseState());
    try{
      http.Response response = await http.delete(Uri.parse('$baseUrl/api/Courses/$courseId',),

          headers:header );
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessDeleteCourseState());
      }else{
        emit(ErrorDeleteCourseState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorDeleteCourseState());
    }
  }

  void confirmCode({required String courseCode ,})async{
    emit(LoadingConfirmCodeState());
    String id = SharedPref.getDate(key: 'kIdAccount');
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Students/ConfirmCourseByCode',).replace(
          queryParameters: {
            'coursecode': courseCode,
            'studentid': '$id'
          }
      ),
          headers:header);
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessConfirmCodeState());
      }else{
        emit(ErrorConfirmCodeState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorConfirmCodeState());
    }
  }

  void uploadAssignment({required String assignmentName ,required String assignmentUrl , required String courseId})async{
    emit(LoadingUploadAssignmentState());
    String id = SharedPref.getDate(key: 'kIdAccount');
    try{
      http.Response response = await http.post(Uri.parse('$baseUrl/api/Uploads/UploadAssignment',),
          body: json.encode({
            'assignmentName': assignmentName,
            'assignmentUrl': assignmentUrl,
            'courseId':courseId,
            'studentId':id
          }),
          headers:header );
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessUploadAssignmentState());
      }else{
        emit(ErrorUploadAssignmentState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorUploadAssignmentState());
    }
  }

  List<AssignmentModel> assignmentList=[];
  void getStudentAssignment({required String courseId })async{
    emit(LoadingShowStudentAssignmentState());
    assignmentList=[];
    String id = SharedPref.getDate(key: 'kIdAccount');
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Uploads/GetAssignments/$courseId/$id'),
          headers:header );
      dynamic data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200){
        for(int i=0; i < data.length; i++){
          assignmentList.add(AssignmentModel.jsonData(data[i]));
        }
        emit(SuccessShowStudentAssignmentState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorShowStudentAssignmentState());
    }
  }

  void getAllAssignment({required String courseId })async{
    emit(LoadingShowStudentAssignmentState());
    assignmentList=[];
    String id = SharedPref.getDate(key: 'kIdAccount');
    try{
      http.Response response = await http.get(Uri.parse('$baseUrl/api/Uploads/GetAllAssignments/$courseId'),
          headers:header );
      dynamic data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200){
        for(int i=0; i < data.length; i++){
          assignmentList.add(AssignmentModel.jsonData(data[i]));
        }
        emit(SuccessShowStudentAssignmentState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorShowStudentAssignmentState());
    }
  }

  void addCommentAssignment({required String comment ,required String idAssignment})async{
    emit(LoadingPutCommentAssignmentState());
    try{
      http.Response response = await http.put(Uri.parse('$baseUrl/api/Uploads/PutCommentAssignment/$idAssignment',),
          body: json.encode({
            'comment': comment,
          }),
          headers:header );
      var data = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode==200 || response.statusCode==201){
        emit(SuccessPutCommentAssignmentState());
      }else{
        emit(ErrorPutCommentAssignmentState());
      }
    }catch(e){
      print(e.toString());
      emit(ErrorPutCommentAssignmentState());
    }
  }



}




