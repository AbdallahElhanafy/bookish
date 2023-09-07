import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  Color backColor = Colors.white;

  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    emit(SimilarBooksLoading());
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);

    backColor = paletteGenerator.dominantColor?.color ?? Colors.white;
    emit(SimilarBooksSucess([]));
    return backColor;
  }

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (faliure) {
        emit(
          SimilarBooksFaliure(faliure.errMessage),
        );
      },
      (books) {
        emit(
          SimilarBooksSucess(books),
        );
      },
    );
  }
}
