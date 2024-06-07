class GetTaskParameters {
  final int page;
  final int perPage;

  GetTaskParameters({required this.page, required this.perPage});

  Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
      };
}
