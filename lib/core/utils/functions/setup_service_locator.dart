import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/book%20details/data/repos/similar_books_repo_impl.dart';
import 'package:bookly_app/features/book%20details/domain/repos/similar_books_repo.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SimilarBooksRepo>(
    SimilarBooksRepoImpl(getIt<ApiService>()),
  );
}
