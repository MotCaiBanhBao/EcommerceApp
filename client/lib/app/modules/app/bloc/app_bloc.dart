import 'dart:async';

import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:client/app/helper/localization.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  StreamSubscription? subscription;
  AppBloc(this.flutterLocalNotificationsPlugin, this._remoteUserApi)
      : super(const _Initial()) {
    on<_ChangeLanguage>(_changeLanguage);
    on<_OnConnected>(_onConnected);
    on<_OnDisConnected>(_onDisConnected);
    on<_Started>(_started);
    FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      onMessaged(message);
    });
    FirebaseMessaging.onBackgroundMessage(onMessagedBack);

    // subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.mobile ||
    //       result == ConnectivityResult.wifi) {
    //     print('Co mang');
    //     add(const _OnConnected());
    //   } else if (result == ConnectivityResult.none) {
    //     print('Khong co mangj');
    //     add(const _OnDisConnected());
    //   }
    // });
  }

  AuthRepository _remoteUserApi;
  Future<void> onMessaged(RemoteMessage message) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.high,
            playSound: true,
            sound: RawResourceAndroidNotificationSound("noti_sound_default"),
            priority: Priority.high,
            ticker: 'ticker');
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title ?? '',
        message.notification?.body.toString(),
        platformChannelSpecifics,
        payload: 'item x');

    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  }

  Future<void> onMessagedBack(RemoteMessage message) async {
    print('Got a message whilst in the back!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  Future<void> _started(_Started event, Emitter<AppState> emit) async {
    await _remoteUserApi.getUser().then((value) async {
      if (value != null) {
        await FirebaseMessaging.instance
            .subscribeToTopic(value.id!)
            .whenComplete(() {
          print('topic ${value.id!}');
        });
      }
    });
    await FirebaseMessaging.instance
        .subscribeToTopic('app')
        .whenComplete(() => print('ok'));

    // await FirebaseMessaging.instance
    //     .subscribeToTopic('buyer')
    //     .whenComplete(() => print('ok'));
    await FirebaseMessaging.instance
        .subscribeToTopic('shoper')
        .whenComplete(() => print('ok'));

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _changeLanguage(_ChangeLanguage event, Emitter<AppState> emit) {
    emit(state.copyWith(language: event.language));
  }

  void _onConnected(_OnConnected event, Emitter<AppState> emit) {
    print('connected');
  }

  void _onDisConnected(_OnDisConnected event, Emitter<AppState> emit) {
    print('disconnected');
  }
}
