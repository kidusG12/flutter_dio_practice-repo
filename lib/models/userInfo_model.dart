class UserInfo {
  String name;
  String job;
  String? id;
  String? createdAt;
  String? updatedAt;

  UserInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        name: json['name'],
        job: json['job'],
        id: json['id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
