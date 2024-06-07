class BioParameters {
  final String bio;

  BioParameters({required this.bio});

  Map<String, dynamic> toJson() => {
        'bio': bio,
      };
}
