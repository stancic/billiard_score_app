class PlayerModel {
  final String id;
  final String firstName;
  final String lastName;
  String imageUrl;
  int gamesPlayed;
  int matchesWon;
  int matchesLost;

  PlayerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.imageUrl = '',
    this.gamesPlayed = 0,
    this.matchesWon = 0,
    this.matchesLost = 0,
  });
}
