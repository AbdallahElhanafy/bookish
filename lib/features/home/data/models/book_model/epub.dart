import 'package:equatable/equatable.dart';

class Epub extends Equatable {
  final bool? isAvailable;
  final String? downloadLink;

  const Epub(this.downloadLink, {this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        json['downloadLink'] as String?,
        isAvailable: json['isAvailable'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'downloadLink': downloadLink,
      };

  @override
  List<Object?> get props => [
    isAvailable,
    downloadLink,
    
    ];
 
}
