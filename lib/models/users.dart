class Users {
  final int? usrId;
  final String? usrFullName;
  final String usrEmail;
  final String usrPassword;

  Users({
    this.usrId,
    required this.usrFullName,
    required this.usrEmail,
    required this.usrPassword
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrId: json["usrID"],
    usrFullName: json["usrFullName"],
    usrEmail: json["usrEmail"],
    usrPassword: json["usrPassword"],

  );

  Map<String, dynamic> toMap() => {
    "usrID": usrId,
    "usrFullName": usrFullName,
    "usrEmail": usrEmail,
    "usrPassword": usrPassword,

  };
}