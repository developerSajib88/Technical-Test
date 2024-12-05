import 'package:technical_test/core/routes/routes_error_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test/features/dynamic_table/presentation/dynamic_table_screen.dart';

class AppRoutes{

  static GoRouter routes = GoRouter(

      debugLogDiagnostics: true,
      initialLocation: DynamicTable.path,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          RouteErrorPage(state: state),
      redirect: (BuildContext context, GoRouterState state){
        return null;
      },
      routes: [

        //Dynamic Table Screen Route And Initial route
        GoRoute(
          path: DynamicTable.path,
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
                key: state.pageKey,
                child: const DynamicTable(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                    CupertinoPageTransition(primaryRouteAnimation: animation, secondaryRouteAnimation: secondaryAnimation, linearTransition: true, child: child)
            );
          },
        ),



      ]
  );
}