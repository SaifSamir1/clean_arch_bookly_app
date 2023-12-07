




import 'package:bookly/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_error_message.dart';
import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../manger/search_cubit/search_cubit.dart';
import '../../manger/search_cubit/search_states.dart';
import 'searched_result.dart';


class SearchedResultListViewBlocConsumer extends StatefulWidget {
  const SearchedResultListViewBlocConsumer({
    super.key,
  });

  @override
  State<SearchedResultListViewBlocConsumer> createState() => _SearchedResultListViewBlocConsumerState();
}

class _SearchedResultListViewBlocConsumerState extends State<SearchedResultListViewBlocConsumer> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
        listener: (BuildContext context, state) {
          if (state is SearchBooksSuccess) {
            searchedBooks.addAll(state.books);
          }
          if (state is SearchBooksPaginationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(buildErrorSnackBar(state.errorMessage));
          }
        }, builder: (BuildContext context, state) {
      if (state is SearchBooksSuccess ||
          state is SearchBooksPaginationLoading ||
          state is SearchBooksPaginationFailure) {
        return SearchedResultListView(
          books: searchedBooks,
        );
      } else if (state is SearchBooksFailure) {
        return CustomErrorWidget(
          errorMessage: state.errMessage,
        );
      }
      return Container();
    });
  }
}
