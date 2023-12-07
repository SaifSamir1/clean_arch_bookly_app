



import 'package:bookly/Features/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newest_book_cubit/newest_book_states.dart';
import 'package:bookly/Features/home/presentation/views/widgets/shimmer_newset_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/custom_error_message.dart';
import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import 'newest_books_list_view.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
        listener: (BuildContext context, state) {
          if (state is NewestBooksSuccess) {
            books.addAll(state.books);
          }
          if (state is NewestBooksPaginationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(buildErrorSnackBar(state.errorMessage));
          }
        }, builder: (BuildContext context, state) {
      if (state is NewestBooksSuccess ||
          state is NewestBooksPaginationLoading ||
          state is NewestBooksPaginationFailure) {
        return NewestBooksListView(
          books: books,
        );
      } else if (state is NewestBooksFailure) {
        return CustomErrorWidget(
          errorMessage: state.errMessage,
        );
      }
      return const ShimmerNewestListView();
    });
  }
}
