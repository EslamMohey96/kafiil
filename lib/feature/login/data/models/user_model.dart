class UserModel {
  late String firstName;
  late String lastName;
  late String about;
  late String userType;
  late String email;
  late String salary;
  late String uId;
  late String image;
  late bool isEmailVerified;


  UserModel({
    required this.email,
    required this.about,
    required this.salary,
    required this.uId,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.image,
    required this.isEmailVerified,    
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    firstName = json?['firstName'];
    lastName = json?['lastName'];
    userType = json?['userType'];
    email = json?['email'];
    about = json?['about'];
    salary = json?['salary'];
    image = json?['image'];
    uId = json?['uId'];
    isEmailVerified = json?['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userType': userType,
      'email': email,
      'about': about,
      'salary': salary,
      'image': image,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
