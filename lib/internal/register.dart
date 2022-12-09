import 'package:minishop/core/di/di.dart';
import 'package:minishop/internal/dependencies/repository_module.dart';

abstract class Dependency {
  static init() {
    Di.reg(() => RepositoryModule().cartRepository, asBuilder: true);
    Di.reg(() => RepositoryModule().favoritRepository, asBuilder: true);
    Di.reg(() => RepositoryModule().productRepository, asBuilder: true);
  }
}
