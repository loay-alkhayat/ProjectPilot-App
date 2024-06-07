class SearchSupervisorsParameters {
  final String supervisorsName;

  SearchSupervisorsParameters({required this.supervisorsName});

  Map<String, dynamic> toJson() => {
        'name': supervisorsName,
      };
}
