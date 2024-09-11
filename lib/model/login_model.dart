
class LoginModel{
  String? accessToken;
  String? tokenType;
  int? userId;
  String? userName;
  int? expiresIn;
  int? creationTime;
  int? expirationTime;
  int? accountId;
  String ? email;
  String ? role;

  LoginModel(
      {this.email,
      this.userId,
      this.userName,
      this.accessToken,
      this.accountId,
      this.creationTime,
      this.expirationTime,
      this.expiresIn,
      this.role,
      this.tokenType});

  factory LoginModel.jsonData(data){
    return LoginModel(
      email: data['email'],
      userName: data['user_name'],
      userId: data['user_Id'],
      accessToken: data['access_token'],
      accountId: data['accountid'],
      creationTime: data['creation_Time'],
      expirationTime: data['creation_Time'],
      expiresIn: data['expires_in'],
      role: data['role'],
      tokenType: data['token_type'],

    );
  }
}


//"courses": null

class ProfileDoctor{
  int ? id;
  String ? fullName;
  String ? userName;
  String ? password;
  String ? email;
  String ? phone;
  String ? levelName;
  int ? levelId;

  ProfileDoctor(
      {this.fullName,
      this.email,
      this.phone,
      this.id,
      this.userName,
      this.levelName,
      this.levelId,
      this.password});

  factory ProfileDoctor.jsonData(data){
    return ProfileDoctor(
      email: data['email'],
      fullName:  data['fullName'],
      phone:  data['phone'],
      id:  data['id'],
      userName:  data['userName'],
      password:  data['password'],
      levelId:  data['levelId'],
      levelName:  data['levelName'],
    );
  }


}