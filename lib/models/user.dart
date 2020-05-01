class User {
  String uid;
  String name;
  String surname; //added
  String email;
  int age; // added
  int height; // added
  int weight; // added
  String bloodGroup; // added
  String username;
  String status;
  int state;
  String profilePhoto;
  List consultations; // added

  User(
      {this.uid,
      this.name,
      this.surname,
      this.email,
      this.age,
      this.height,
      this.weight,
      this.bloodGroup,
      this.username,
      this.status,
      this.state,
      this.profilePhoto,
      this.consultations});

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['suranme'] = user.surname;
    data['email'] = user.email;
    data['age'] = user.age;
    data['height'] = user.height;
    data['weight'] = user.weight;
    data['blood_group'] = user.bloodGroup;
    data['username'] = user.username;
    data["status"] = user.status;
    data["state"] = user.state;
    data["profile_photo"] = user.profilePhoto;
    data["consultations"] = user.consultations;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.surname = mapData['surname'];
    this.email = mapData['email'];
    this.age = mapData['age'];
    this.height = mapData['height'];
    this.weight = mapData['weight'];
    this.bloodGroup = mapData['blood_group'];
    this.username = mapData['username'];
    this.status = mapData['status'];
    this.state = mapData['state'];
    this.profilePhoto = mapData['profile_photo'];
    this.consultations = mapData['consultations'];
  }
}
