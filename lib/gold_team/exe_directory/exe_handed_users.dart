class MyUser {
  final String? username;
  final List<String>? handedUsers;

  MyUser({required this.username, required this.handedUsers});
}

List<MyUser> usersHanded = [
  MyUser(
      username: "Sardorbek", handedUsers: ["user2", "user3", "user4", "user5"]),
  MyUser(username: "user2", handedUsers: ["user1", "user4"]),
  MyUser(username: "user3", handedUsers: ["user1", "user5"]),
  MyUser(username: "user4", handedUsers: ["user2"]),
  MyUser(username: "user5", handedUsers: ["user3"]),
];

// List<String> handedUsers = ["user2", "user3", "user4", "user5"];
