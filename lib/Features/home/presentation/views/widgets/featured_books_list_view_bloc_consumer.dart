import 'package:bookly/Features/home/presentation/manger/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/featured_book_cubit/featured_book_states.dart';
import 'package:bookly/Features/home/presentation/views/widgets/shimmer_featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/custom_error_message.dart';
import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (BuildContext context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is FeaturedBooksPaginationFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildErrorSnackBar(state.errorMessage));
      }
    }, builder: (BuildContext context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationFailure) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(
          errorMessage: state.errMessage,
        );
      }
      return const ShimmerFeaturedListView();
    });
  }
}
