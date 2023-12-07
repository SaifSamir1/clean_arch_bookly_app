import 'package:bookly/Features/Splash/presentation/views/main_book_selection_screen.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/domain/use_cases/searched_books_use_case.dart';
import 'package:bookly/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import '../../Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../Features/home/presentation/manger/featured_book_cubit/featured_book_cubit.dart';
import '../../Features/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import '../../Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/search/data/repo/search_repo_impl.dart';
import '../entities/book_entity.dart';
import 'functions/setup_service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSelectionBooksView = '/selectionBooksView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
            create: (context) => SearchBooksCubit(
              SearchedBooksUseCase(getIt.get<SearchedRepoImpl>(),),
            ),
            child: const SearchView()),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(providers: [
          BlocProvider(create: (context) {
            return FeaturedBooksCubit(FetchFeatureBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ))..fetchFeaturedBooks(mainBooks:mainBooks);
          }),
          BlocProvider(create: (context) {
            return NewestBooksCubit(FetchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ))..fetchNewestBooks(mainBooks:mainBooks);
          }),
        ],
        child: const HomeView()),
      ),
      GoRoute(
        path: kSelectionBooksView,
        builder: (context, state) => const MainBookSelectionScreen(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>(),),
          ),
          child: BookDetailsView(
            bookDetails: state.extra as BookEntity,
          ),
        ),
      ),
    ],
  );
}
