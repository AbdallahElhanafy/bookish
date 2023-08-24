import 'package:ebook_app/features/search/presentation/view/widgets/search_view_body.dart';

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: true,
      bottom: false,
      child: SearchViewBody(),
    );
  }
}
