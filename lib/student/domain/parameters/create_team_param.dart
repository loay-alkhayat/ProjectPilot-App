class CreateTeamParameters {
  final String teamName;

  CreateTeamParameters({required this.teamName});

  Map<String, dynamic> toJson() => {
        'name': teamName,
      };
}
