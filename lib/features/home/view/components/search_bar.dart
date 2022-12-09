import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';
import 'package:minishop/common/theme/icons.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(191, 197, 245, 0.02),
                      blurStyle: BlurStyle.outer,
                      offset: Offset(5, 5)),
                  BoxShadow(
                      color: Color.fromRGBO(191, 197, 245, 0.02),
                      blurStyle: BlurStyle.outer,
                      offset: Offset(-5, -5)),
                ],
              ),
              child: SizedBox(
                height: 34,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 15),
                      fillColor: context.theme.cardColor,
                      filled: true,
                      hintText: context.loc.search,
                      hintStyle: const TextStyle(fontSize: 12),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 15),
                        child: Icon(
                          UIIcon.search,
                          color: context.theme.accentColor,
                          size: 16,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: context.theme.cardColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: context.theme.cardColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)))),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 34,
            height: 34,
            decoration: ShapeDecoration(
                color: context.theme.accentColor,
                shape: CircleBorder(
                    side: BorderSide(color: context.theme.accentColor))),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                UIIcon.category,
                size: 16,
              ),
              color: context.theme.cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
