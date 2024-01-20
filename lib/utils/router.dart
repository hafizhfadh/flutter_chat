import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/chat_list_screen.dart';
import 'package:flutter_chat/screens/login_screen.dart';
import 'package:flutter_chat/screens/register_screen.dart';
import 'package:flutter_chat/screens/start_chat_screen.dart';
import 'package:flutter_chat/utils/constants.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  redirect: (BuildContext context, GoRouterState routeState) async {
    var auth = supabase.auth.currentSession?.user;
    if (auth != null) {
      return '/chat_list';
    } else {
      //else, remain at login page
      return null;
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: '/chat_list',
      builder: (BuildContext context, GoRouterState state) {
        return const ChatListScreen();
      },
    ),
    GoRoute(
      path: '/start_chat',
      builder: (BuildContext context, GoRouterState state) {
        return const StartChatScreen();
      },
    ),
  ],
);
