class SearchEngineersParameters {
  final String engineersName;

  SearchEngineersParameters({required this.engineersName});

  Map<String, dynamic> toJson() => {
        'name': engineersName,
      };
}
