import 'package:equatable/equatable.dart';

class GetBlogsEntity extends Equatable {
  final String status;
  final int pages;
  final String message;
  final GetBlogsData data;

  const GetBlogsEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, data, pages, message];
}

class GetBlogsData extends Equatable {
  final List<Blogs> blogs;

  const GetBlogsData({required this.blogs});

  @override
  List<Object?> get props => [blogs];
}

class Blogs extends Equatable {
  final int id;
  final String title;
  final String content;
  final String date;

  const Blogs(
      {required this.id,
      required this.title,
      required this.content,
      required this.date});

  @override
  List<Object?> get props => [content, date, title, id];
}
