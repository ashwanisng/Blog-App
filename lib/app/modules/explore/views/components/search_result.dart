import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  String searchedUser;

  SearchResult({
    Key? key,
    required this.searchedUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(searchedUser),
      ),
    );
  }
}
