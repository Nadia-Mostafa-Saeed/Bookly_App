import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
