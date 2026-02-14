import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ballot_eye/features/auth/domain/entities/app_user.dart';
import 'package:ballot_eye/core/utils/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
abstract class AppUserModel with _$AppUserModel {
  const factory AppUserModel({
    required String id,
    required String email,
    required String name,
    required String role,
    List<String>? areaIds,
    @TimestampConverter() required DateTime createdAt,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) => _$AppUserModelFromJson(json);

  factory AppUserModel.fromEntity(AppUser user) => AppUserModel(
        id: user.id,
        email: user.email,
        name: user.name,
        role: user.role,
        areaIds: user.areaIds,
        createdAt: user.createdAt,
      );

  const AppUserModel._();

  AppUser toEntity() => AppUser(
        id: id,
        email: email,
        name: name,
        role: role,
        areaIds: areaIds,
        createdAt: createdAt,
      );
}
