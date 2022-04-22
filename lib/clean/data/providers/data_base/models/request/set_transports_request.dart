import 'package:equatable/equatable.dart';

class SetTransportsRequest extends Equatable {
  final List<TransportsDB> transport;

  const SetTransportsRequest({required this.transport});

  factory SetTransportsRequest.fromJson(Map<String, dynamic> data) {
    final trnsp = <TransportsDB>[];
    for (var trn in data['results']) {
      trnsp.add(
          TransportsDB(id: trn['url'], name: trn['name'], type: 'VEHICLE'));
    }
    return SetTransportsRequest(transport: trnsp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['transport'] = transport.map((e) => e.toJson()).toList();

    return data;
  }

  @override
  List<Object?> get props => [transport];
}

class TransportsDB extends Equatable {
  final String id;
  final String name;
  final String type;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['transport_id'] = id;
    data['name'] = name;
    data['type'] = type;
    return data;
  }

  TransportsDB({required this.id, required this.name, required this.type});

  @override
  List<Object?> get props => [id, name, type];
}
