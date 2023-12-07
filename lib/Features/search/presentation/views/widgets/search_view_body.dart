import 'package:flutter/material.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/styles.dart';
import 'searched_books_list_view_bloc_consumer.dart';
import 'custom_search_text_field.dart';

List<BookEntity> searchedBooks = [];


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
          child: CustomSearchTextField(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Result of your search', style: Styles.textStyle18),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SearchedResultListViewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}

