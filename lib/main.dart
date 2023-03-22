import 'package:catalogg/desktop/screens/desktop_add_new_product_screen.dart';
import 'package:catalogg/providers.dart/home_screen_provider.dart';
import 'package:catalogg/screens/add_new_product_screen.dart';
import 'package:catalogg/screens/category_detail_screen.dart';
import 'package:catalogg/screens/company_detail_screen.dart';
import 'package:catalogg/screens/home_screen.dart';
import 'package:catalogg/screens/login_screen.dart';
import 'package:catalogg/screens/register_screen.dart';
import 'package:catalogg/screens/saved_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: HomeScreen.routName,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'category-detail/:categoryId',
                name: CategoryDetailScreen.routeName,
                builder: (context, state) => CategoryDetailScreen(
                  id: int.parse(state.params['categoryId'] as String),
                ),
              ),
              GoRoute(
                path: 'company-detail/:categoryId/:companyId',
                name: CompanyDetailScreen.routeName,
                builder: (context, state) => CompanyDetailScreen(
                  categoryId: int.parse(state.params['categoryId'] as String),
                  companyId: int.parse(state.params['companyId'] as String),
                ),
              ),
              GoRoute(
                path: 'newproduct',
                name: AddNewProductScreen.routeName,
                builder: (context, state) => const AddNewProductScreen(),
              ),
              GoRoute(
                path: 'saved-products',
                name: SavedProductScreen.routeName,
                builder: (context, state) => const SavedProductScreen(),
              ),
              GoRoute(
                path: 'login',
                name: LoginScreen.routeName,
                builder: (context, state) => const LoginScreen(),
                routes: [
                  GoRoute(
                    path: 'register',
                    name: RegisterScreen.routeName,
                    builder: (context, state) => const RegisterScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
