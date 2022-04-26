import 'package:equatable/equatable.dart';

class ReportPersonRequest extends Equatable {
  final int id;
  final String date;
  final String name;

  ReportPersonRequest(
      {required this.id, required this.date, required this.name});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = id;
    data['dateTime'] = date;
    data['character_name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [id, date, name];
}
