import 'package:equatable/equatable.dart';

import 'image_links.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final ImageLinks? imageLinks;

  const VolumeInfo({this.title, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String?,
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'imageLinks': imageLinks?.toJson(),
      };

  @override
  List<Object?> get props => [title, imageLinks];
}
