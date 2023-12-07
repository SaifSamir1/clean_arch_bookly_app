import 'package:bookly/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/delete_box_from_hive.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../manger/search_cubit/search_cubit.dart';
import '../../manger/search_cubit/search_states.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        return TextField(
          controller: searchController,
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: Opacity(
              opacity: .8,
              child: IconButton(
                onPressed: () {
                  deleteAllData(boxNamed: kSearchedBox);
                  Future.delayed(const Duration(milliseconds: 300), () {
                    if (searchController.text.isNotEmpty) {
                      searchedBooks = [];
                      BlocProvider.of<SearchBooksCubit>(context)
                          .fetchSearchBooks(
                              searchedBook: searchController.text);
                    }
                  });
                },
                color: Colors.white,
                icon: const Icon(Icons.search_sharp),
              ),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white));
  }
}
