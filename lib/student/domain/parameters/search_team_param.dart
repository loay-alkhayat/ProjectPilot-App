class SearchTeamParameters {
  final String teamName;

  SearchTeamParameters({required this.teamName});

  Map<String, dynamic> toJson() => {
        'name': teamName,
      };
}
