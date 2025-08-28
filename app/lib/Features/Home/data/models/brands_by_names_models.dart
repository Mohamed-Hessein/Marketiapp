import 'package:equatable/equatable.dart';

class BrandsModel extends Equatable {
  final String? name;
  final String? emoji;

  const BrandsModel({this.name, this.emoji});

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
    name: json['name'] as String?,
    emoji: json['emoji'] as String?,
  );

  Map<String, dynamic> toJson() => {'name': name, 'emoji': emoji};

  @override
  List<Object?> get props => [name, emoji];
}
