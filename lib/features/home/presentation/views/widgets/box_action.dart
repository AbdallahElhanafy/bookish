import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/functions/getBookStatus.dart';
import 'package:ebook_app/core/utils/functions/launch_url.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/view_models/book_status/book_status_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_status_button.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksAction extends StatefulWidget {
  const BooksAction({super.key, required this.bookModel});

  final NewBookModel bookModel;

  @override
  State<BooksAction> createState() => _BooksActionState();
}

class _BooksActionState extends State<BooksAction> {
  late bool _isBookInLibrary;

  @override
  void initState() {
    super.initState();
    _isBookInLibrary = false;
    BlocProvider.of<BookStatusCubit>(context)
        .checkIfBookIsInLibrary(widget.bookModel);
  }

  void setIsBookInLibrary(bool value) {
    setState(() {
      _isBookInLibrary = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: CustomButton(
            onPressed: () async {
              if (widget.bookModel.saleInfo?.saleability == 'NOT_FOR_SALE'){

              }
              else {
                launchCustomUrl(
                  context, widget.bookModel.accessInfo!.webReaderLink);
              }
              
            },
            text: getText(widget.bookModel),
            textColor: Colors.white,
            backgroundColor: kSecondaryColor,
            borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))
                .r,
          ),
        ),
    const    VerticalDivider(
          width: 3,
        ),
       BookStatusWidget(
          bookModel: widget.bookModel,
          context: context,
       ),
      ],
    );
  }

  
}
