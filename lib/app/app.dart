import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:minishop/app/bloc/app_cart_bloc.dart';
import 'package:minishop/app/routing/go_routing.dart';
import 'package:minishop/common/theme/app_theme.dart';
import 'package:minishop/common/theme/theme_delegate.dart';
import 'package:flutter_gen/gen_l10n/local.dart';
import 'package:minishop/internal/register.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Routing _routConfig = Routing();
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = _routConfig.initRouter('/');
    Dependency.init();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        print('${record.level.name}: ${record.time}: ${record.message}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      themeDelegate: AppThemeDelegate(),
      builder: (theme) => BlocProvider(
        create: (context) => AppCartBloc(),
        child: MaterialApp.router(
          localizationsDelegates: Local.localizationsDelegates,
          supportedLocales: Local.supportedLocales,
          theme: theme,
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}
