import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/categories/data/repos/categories_repo.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo, this.category) : super(CategoriesInitial());

  final CategoriesRepo categoriesRepo;

  String category;

  Future<void> getCategory({required String category}) async {
    emit(CategoriesLoading());
    var result = await categoriesRepo.getCategory(category: category);

    result.fold(
      (faliure) {
        emit(
          CategoriesFailure(errMessage: faliure.errMessage),
        );
      },
      (books) {
        emit(
          CategoriesSuccess(books),
        );
      },
    );
  }
}
