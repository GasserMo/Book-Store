import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/search/presentation/views/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetData.logo,
            height: 30,
          ),
          Spacer(),
          IconButton(
              onPressed: () {
             showSearch(context: context, delegate: Search());
              },
              icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 24)),
        ],
      ),
    );
  }
}
