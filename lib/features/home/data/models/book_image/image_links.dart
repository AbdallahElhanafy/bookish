import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;
  final String? small;
  final String? medium;
  final String? large;
  final String? extraLarge;

  const ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'] as String?,
        thumbnail: json['thumbnail'] as String?,
        small: json['small'] as String?,
        medium: json['medium'] as String?,
        large: json['large'] as String?,
        extraLarge: json['extraLarge'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
        'small': small,
        'medium': medium,
        'large': large,
        'extraLarge': extraLarge,
      };

  @override
  List<Object?> get props {
    return [
      smallThumbnail,
      thumbnail,
      small,
      medium,
      large,
      extraLarge,
    ];
  }
}
