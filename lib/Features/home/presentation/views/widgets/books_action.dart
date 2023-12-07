import 'package:flutter/material.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/launcher_url.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookEntity});

  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: ()
              {},
              text: 'Free',
              borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
              ),
              backGroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()
              {
                launchCustomUr(context,bookEntity.bookLink);
              },
              text: getText(bookEntity),
              borderRadius:const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)
              ),
              backGroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookEntity bookEntity)
  {
    if(bookEntity.bookLink == 'Not Available')
    {
      return 'Not Available';
    }
    else {
      return 'preview';
    }
  }
}
