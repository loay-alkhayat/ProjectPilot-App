class SearchStudentsParameters {
  final String studentsName;

  SearchStudentsParameters({required this.studentsName});

  Map<String, dynamic> toJson() => {
        'name': studentsName,
      };
}
