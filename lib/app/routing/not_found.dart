import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Text(context.loc.pageNotFoundTitle),
        ),
        body: Center(
            child: Text(
          context.loc.pageNotFoundDesc,
          textAlign: TextAlign.center,
        )));
  }
}
