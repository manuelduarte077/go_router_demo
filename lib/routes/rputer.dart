import 'package:go_router/go_router.dart';
import 'package:go_router_demo/pages.dart';
import 'package:go_router_demo/user.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/',
      name: 'main_page',
      builder: (context, state) => const MainPage(),

      /// Rutas que salen de Home
      routes: [
        GoRoute(
          path: 'about',
          name: 'about',
          builder: (context, state) => const AboutPage(),
        ),

        /// Rutas para el perfil
        GoRoute(
          path: 'profile/:name',
          name: 'profile',
          builder: (context, state) {
            String name = state.params['name'] ?? 'No Name';
            return ProfilePage(name: name);
          },
          routes: [
            GoRoute(
              path: 'edit_profile',
              name: 'edit_profile',
              builder: (context, state) {
                Object? object = state.extra;
                if (object != null && object is User) {
                  return EditProfilePage(user: object);
                } else {
                  return const EditProfilePage(
                    user: User('No Name', 'No Email'),
                  );
                }
              },
            )
          ],
        )
      ],
    )
  ],
  initialLocation: '/login',
  debugLogDiagnostics: true,
  routerNeglect: true,
);
