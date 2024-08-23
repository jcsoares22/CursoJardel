import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String title;
  final int status;

  const ErrorModel({
    required this.title,
    required this.status,
  });

  factory ErrorModel.fromjson(Map<String, dynamic> json) {
    return ErrorModel(
      title: json['title'],
      status: json['status'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, status];
//fazer o metodo e ao test from json
}
