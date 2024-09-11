import 'package:news_app/data/model/source.dart';

class SourcesResponse {
  final String? status;
  final List<Source>? sources;
  const SourcesResponse({this.status, this.sources});
  SourcesResponse copyWith({String? status, List<Source>? sources}) {
    return SourcesResponse(
        status: status ?? this.status, sources: sources ?? this.sources);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'sources':
          sources?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static SourcesResponse fromJson(Map<String, Object?> json) {
    return SourcesResponse(
        status: json['status'] == null ? null : json['status'] as String,
        sources: json['sources'] == null
            ? null
            : (json['sources'] as List)
                .map<Source>(
                    (data) => Source.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''SourcesResponse(
                status:$status,
sources:${sources.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SourcesResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.sources == sources;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, sources);
  }
}
