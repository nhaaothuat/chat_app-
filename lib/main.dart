import 'package:chat_app/chat_page.dart';
import 'package:chat_app/conversation/data/datasource/conversation_datasource.dart';
import 'package:chat_app/conversation/data/repositories/conversation_repository.dart';
import 'package:chat_app/conversation/domain/repositories/conversation_repository.dart';
import 'package:chat_app/conversation/domain/usecases/fetch_conversation.dart';
import 'package:chat_app/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:chat_app/conversation/presentation/pages/conversation_page.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/features.auth/data/datasource/auth_datasource.dart';
import 'package:chat_app/features.auth/data/repositories/auth_repo.dart';

import 'package:chat_app/features.auth/domain/usecases/login_us.dart';
import 'package:chat_app/features.auth/domain/usecases/register_uc.dart';
import 'package:chat_app/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_app/features.auth/presentation/pages/login_page.dart';
import 'package:chat_app/features.auth/presentation/pages/register_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

void main() {
  final authRepository = AuthRepoImple(authDataSource: AuthDataSource());
  final conversationRepository = ConversationImple(conversationDataSource: ConversationDataSource());
  runApp(MyApp(
    authRepoImple: authRepository,
    conversationImple: conversationRepository,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepoImple authRepoImple;
  final ConversationImple conversationImple;
  const MyApp({super.key, required this.authRepoImple, required this.conversationImple});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthBloc(
                loginUseCase: LoginUseCase(repository: authRepoImple),
                registerUseCase: RegisterUseCase(repository: authRepoImple))),
        BlocProvider(
            create: (_) => ConversationBloc(fetchConversationsUseCase: FetchConversationUseCase(conversationImple)))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
        routes: {
          '/login': (_) => LoginPage(),
          '/register': (_) => RegisterPage(),
          '/chat': (_) => ChatPage(),
          '/conversation':(_)=>ConversationPage(),
        },
      ),
    );
  }
}
