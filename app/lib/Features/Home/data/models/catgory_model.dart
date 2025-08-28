import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String? slug;
  final String? name;
  final String? url;
  final String? image;

  const CategoriesModel({this.slug, this.name, this.url, this.image});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'slug': slug,
    'name': name,
    'url': url,
    'image': image,
  };

  @override
  List<Object?> get props => [slug, name, url, image];
}
