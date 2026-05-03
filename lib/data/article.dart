import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String body;

  const Article({required this.title, required this.body});

  @override
  List<Object?> get props => [title, body];
}