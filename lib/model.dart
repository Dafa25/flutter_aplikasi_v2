import 'package:http/http.dart' as http;

class User {
  String id;
  String avatar;
  String nama;
  String alamat;
  String email;
  String pekerjaan;
  String quote;

  User({
    required this.id,
    required this.avatar,
    required this.nama,
    required this.alamat,
    required this.email,
    required this.pekerjaan,
    required this.quote,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      avatar: json['avatar'],
      nama: json['nama'],
      alamat: json['alamat'],
      email: json['email'],
      pekerjaan: json['pekerjaan'],
      quote: json['quote'],
    );
  }
}
