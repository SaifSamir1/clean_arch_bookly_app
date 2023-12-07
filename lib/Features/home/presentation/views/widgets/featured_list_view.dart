import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/functions/delete_box_from_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/app_router.dart';
import '../../manger/featured_book_cubit/featured_book_cubit.dart';
import 'custom_book_item.dart';


class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(mainBooks: mainBooks,pageNumber: nextPage++);
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: (){
                deleteAllData(boxNamed: kSimilarBox);
                Future.delayed(const Duration(milliseconds: 200),(){
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: widget.books[index]);
                });
              },
              child: CustomBookImage(
                imageUrl: widget.books[index].image ?? 'https://th.bing.com/th/id/OIP.yVPcqCZQLPX9NJic_Pnh4AHaHa?pid=ImgDet&rs=1',
              ),
            ),
          );
        },
      ),
    );
  }
}