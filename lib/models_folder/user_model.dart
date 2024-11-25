class UserModel {
  int? id;
  String? userImage;
  String? userName;
  String? userPhone;
  String? userPassword;

  UserModel({
    this.id,
    this.userImage,
    this.userName,
    this.userPhone,
    this.userPassword,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      userImage: map['userImage'],
      userName: map['userName'],
      userPhone: map['userPhone'],
      userPassword: map['userPassword'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'userImage':userImage,
      'userName':userName,
      'userPhone':userPhone,
      'userPassword':userPassword,
    };
  }
}
