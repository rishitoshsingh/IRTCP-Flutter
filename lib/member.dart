class Member {
  final String login;
  final String avatarUrl;

  Member(this.login, this.avatarUrl) {
    if (login == null) {
      throw ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
    if (avatarUrl == null) {
      throw ArgumentError("avatarUrl of Member cannot be null. "
          "Received: '$avatarUrl'");
    }
  }
}
