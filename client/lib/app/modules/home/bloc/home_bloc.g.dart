// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Initial _$$_InitialFromJson(Map<String, dynamic> json) => _$_Initial(
      userCart: json['userCart'] == null
          ? null
          : CartModel.fromJson(json['userCart'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$HomeInitStatusEnumMap, json['status']) ??
          HomeInitStatus.initial,
      currentPage:
          $enumDecodeNullable(_$MenuStateEnumMap, json['currentPage']) ??
              MenuState.dashboard,
      isBack: json['isBack'] as bool? ?? false,
    );

Map<String, dynamic> _$$_InitialToJson(_$_Initial instance) =>
    <String, dynamic>{
      'userCart': instance.userCart,
      'status': _$HomeInitStatusEnumMap[instance.status],
      'currentPage': _$MenuStateEnumMap[instance.currentPage],
      'isBack': instance.isBack,
    };

const _$HomeInitStatusEnumMap = {
  HomeInitStatus.initial: 'initial',
  HomeInitStatus.loading: 'loading',
  HomeInitStatus.success: 'success',
  HomeInitStatus.failure: 'failure',
};

const _$MenuStateEnumMap = {
  MenuState.dashboard: 'dashboard',
  MenuState.favourite: 'favourite',
  MenuState.message: 'message',
  MenuState.cart: 'cart',
  MenuState.profile: 'profile',
};
