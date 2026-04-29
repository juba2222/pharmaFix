import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

import 'core/di/injection_container.dart' as di;
import 'core/di/injection_container.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/pos/presentation/pages/pos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://uuurmagnaclbhsamzoxy.supabase.co',
    anonKey: 'sb_publishable_Lf-UTp5J68r2Iviw1EG39Q_Nqwf_6LL',
  );
  
  // Initialize Dependency Injection
  await di.init();

  runApp(const PharmaFixApp());
}

class PharmaFixApp extends StatelessWidget {
  const PharmaFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>()..add(AuthCheckRequested()),
      child: MaterialApp(
        title: 'PharmaFix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
          primaryColor: const Color(0xFF01C653),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF01C653)),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          // Explicit navigation to clear stack if needed
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const PosScreen();
          } else if (state is AuthUnauthenticated || state is AuthFailure) {
            return const LoginScreen();
          }

          // Loading or Initial state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFF01C653)),
            ),
          );
        },
      ),
    );
  }
}
