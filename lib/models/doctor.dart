class Doctor {
  int userId;
  String registrationNumber;
  String name;
  String gender;
  String age;
  String title;
  String profileUrl;
  int phoneNumber;
  String email;
  List<String> speciality;
  int experience;
  String description;
  int amount;

  Doctor(
      {this.userId,
      this.name,
      this.gender,
      this.age,
      this.title,
      this.profileUrl,
      this.registrationNumber,
      this.phoneNumber,
      this.email,
      this.speciality,
      this.experience,
      this.description,
      this.amount});
}
