import 'package:equatable/equatable.dart';

import 'volume_info.dart';

class BookImage extends Equatable {
  final String? id;
  final VolumeInfo? volumeInfo;

  const BookImage({required this.id, this.volumeInfo});

  factory BookImage.fromJson(Map<String, dynamic> json) => BookImage(
        id: json['id'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'volumeInfo': volumeInfo?.toJson(),
      };

  @override
  List<Object?> get props => [id, volumeInfo];
}
