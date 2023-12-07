










import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../manger/search_cubit/search_cubit.dart';



class SearchedResultListView extends StatefulWidget {
  const SearchedResultListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<SearchedResultListView> createState() => _SearchedResultListViewState();
}

class _SearchedResultListViewState extends State<SearchedResultListView> {

  late final ScrollController _scrollController;
  var nextPage = 1;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(searchedBook: searchController.text,pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: NewestBookListViewItem(
            book: widget.books[index],
          ),
        );
      },
    );
  }
}
