



import 'package:bookly/Features/home/presentation/views/widgets/shimmer_similar_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/custom_error_message.dart';
import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../manger/similar_books_cubit/similar_books_cubit.dart';
import '../../manger/similar_books_cubit/similar_books_states.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    super.key, required this.bookCategory,
  });

  final String bookCategory;

  @override
  State<SimilarBooksListViewBlocConsumer> createState() => _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
        listener: (BuildContext context, state) {
          if (state is SimilarBooksSuccess) {
            books.addAll(state.books);
          }
          if (state is SimilarBooksPaginationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(buildErrorSnackBar(state.errorMessage));
          }
        }, builder: (BuildContext context, state) {
      if (state is SimilarBooksSuccess ||
          state is SimilarBooksPaginationLoading ||
          state is SimilarBooksPaginationFailure) {
        return SimilarBooksListview(
          books: books, bookCategory: widget.bookCategory,
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorWidget(
          errorMessage: state.errMessage,
        );
      }
      return const ShimmerSimilarListView();
    });
  }
}

