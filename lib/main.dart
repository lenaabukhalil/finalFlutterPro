import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'Features/auth/bloc/auth_bloc.dart';
import 'Features/auth/bloc/auth_event.dart';
import 'Features/auth/ui/login_page.dart';
import 'Features/auth/ui/register_page.dart';
import 'Features/posts/bloc/posts_bloc.dart';
import 'Features/posts/ui/posts_page.dart';
import 'app_root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide AuthBloc and dispatch AppStarted event on initialization
        // This triggers the auth check from local storage
        BlocProvider(
          create: (context) => AuthBloc()..add(const AppStarted()),
        ),
        // Provide PostsBloc for the posts feature
        BlocProvider(
          create: (context) => PostsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Posts App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // Define named routes for navigation
        routes: {
          '/': (context) => const AppRoot(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const PostsPage(),
        },
        // Start with AppRoot which handles state-driven navigation
        initialRoute: '/',
      ),
    );
  }
}
