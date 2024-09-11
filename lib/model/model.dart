
class SemesterModel{
  int ? id;
  int ? courseId;
  String ? courseName;
  String ? semesterName;
  int ? semesterId;
  String ? courseCode;


  SemesterModel({this.id, this.courseName, this.semesterName,this.courseCode,this.semesterId , this.courseId});

  factory SemesterModel.jsonDate(data){
    return SemesterModel(
      id: data['id'],
      courseName: data['courseName'],
      semesterName: data['semesterName'],
      courseCode: data['courseCode'],
      semesterId: data['semesterId'],
      courseId: data['courseId'],
    );
  }
}

class SubjectModel{
  int ? id;
  String ? uploadName;
  String ? fileUrl;
  int ? courseId;
  String ? courseName;

  SubjectModel(
      {this.courseName, this.id, this.courseId, this.fileUrl, this.uploadName});

  factory SubjectModel.jsonData(data){
    return SubjectModel(
      courseName: data['courseName'],
      id: data['id'],
      courseId: data['courseId'],
      fileUrl: data['fileUrl'],
      uploadName: data['uploadName'],
    );
  }
}

class LevelModel{
  int ? id;
  String ? name;

  LevelModel({this.name, this.id});

  factory LevelModel.jsonData(data){
    return LevelModel(
      name: data['name'],
      id: data['id'],
    );
  }
}

class AssignmentModel{
  int ? id;
  String ? assignmentName;
  String ? assignmentUrl;
  String ? studentName;
  String ? comment;


  AssignmentModel(
      {this.assignmentName, this.id, this.assignmentUrl, this.comment, this.studentName});

  factory AssignmentModel.jsonData(data){
    return AssignmentModel(
      studentName: data['studentName'],
      id: data['id'],
      comment: data['comment'],
      assignmentUrl: data['assignmentUrl'],
      assignmentName: data['assignmentName'],
    );
  }
}

