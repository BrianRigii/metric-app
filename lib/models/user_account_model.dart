class UserAccount {
  final String username;
  final int userid;
  final String email;
  final String accesstoken;
  final String regNum;
  final int usertype;
  final int userole;
  final int classId;

  UserAccount(
      {this.username,
      this.classId,
      this.userid,
      this.email,
      this.usertype,
      this.userole,
      this.regNum,
      this.accesstoken});

  factory UserAccount.fromMap(json) {
    return UserAccount(
        username: json['user']['name'],
        userid: json['user']['id'],
        email: json['user']['email'],
        accesstoken: json['access_token'],
        usertype: json['user']['user_type_id'],
        userole: json['user']['user_role_id'],
        regNum: json['user']['registration_num'],
        classId: json['user']['class_id']);
  }
}
