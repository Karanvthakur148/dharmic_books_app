// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => ProductBloc());
  }

  @override
  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => AuthUseCase(c<AuthAPIAbstract>()))
      ..registerSingleton((c) => ProductUseCase(c<ProductAPIAbstract>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<AuthAPIAbstract>(
          (c) => AuthRepository(apiRemoteDatasource: c<AuthNetwork>()))
      ..registerSingleton<ProductAPIAbstract>(
          (c) => ProductRepository(productNetwork: c<ProductNetwork>()));
  }

  @override
  void _configureRemoteDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => AuthNetwork())
      ..registerSingleton((c) => ProductNetwork());
  }

  @override
  void _configureCommon() {}
}
