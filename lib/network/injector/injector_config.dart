import 'package:kiwi/kiwi.dart';
import 'package:quran_app/network/bloc/product_bloc/product_bloc.dart';
import 'package:quran_app/network/domain/remote/auth_network.dart';
import 'package:quran_app/network/domain/remote/product_network.dart';
import 'package:quran_app/network/domain/repo_abstract/api_abstract.dart';
import 'package:quran_app/network/domain/repository/auth_repo.dart';
import 'package:quran_app/network/domain/repository/product_repo.dart';
import 'package:quran_app/network/domain/usecases/auth_usecases.dart';
import 'package:quran_app/network/domain/usecases/product_usecases.dart';
part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
    container = KiwiContainer();
    _$InjectorConfig()._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container.resolve;

  void _configure() {
   _configureBlocs();
    _configureUsecases();
    _configureRepositories();
    _configureRemoteDataSources();
    // _configureLocalDataSources();
    _configureCommon();
  }

  // ============ BLOCS ============
 @Register.singleton(ProductBloc)
  void _configureBlocs();


  // ============ USECASES =========
 @Register.singleton(AuthUseCase)
 @Register.singleton(ProductUseCase)

  void _configureUsecases();

  // ============ REPOSITORIES ============
  @Register.singleton(AuthAPIAbstract,from:AuthRepository)
  @Register.singleton(ProductAPIAbstract,from:ProductRepository)

  void _configureRepositories();

  // ============ REMOTE DATASOURCES ============
  @Register.singleton(AuthNetwork)
  @Register.singleton(ProductNetwork)
  void _configureRemoteDataSources();

  // // ============ LOCAL DATASOURCES ============
  // @Register.singleton(ProductLocalDatasource)
  // void _configureLocalDataSources();

  // ============ COMMON ============
 // @Register.singleton(HttpClient)
  void _configureCommon();

}
