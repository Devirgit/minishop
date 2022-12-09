import 'package:flutter/material.dart';
import 'package:minishop/common/context_extention.dart';

class FilterForm extends StatelessWidget {
  const FilterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(76, 95, 143, 0.2),
                blurRadius: 20,
                offset: Offset(0, -5))
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 24, 30, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _FormHeader(),
                  const SizedBox(
                    height: 40,
                  ),
                  _FilterComboBox(
                    label: context.loc.filterBrand,
                    selectItem: 1,
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('Samsung'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('Apple'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _FilterComboBox(
                    label: context.loc.filterPrice,
                    selectItem: 1,
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('\$0 - \$10000'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _FilterComboBox(
                    label: context.loc.filterSize,
                    selectItem: 1,
                    onChanged: (value) {},
                    items: const [
                      DropdownMenuItem(
                        value: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('4.5 to 5.5 inches'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormHeader extends StatelessWidget {
  const _FormHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
                color: context.theme.fontColor,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () => Forms.close(),
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: context.theme.cardColor,
                ))),
        Expanded(
            child: Text(
          context.loc.filterOptions,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        )),
        InkWell(
          onTap: () => Forms.close(),
          child: Container(
            height: 37,
            width: 86,
            decoration: BoxDecoration(
                color: context.theme.accentColor,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              context.loc.doneAction,
              style: TextStyle(color: context.theme.cardColor, fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}

class _FilterComboBox<T> extends StatelessWidget {
  const _FilterComboBox(
      {Key? key,
      required this.label,
      required this.selectItem,
      required this.items,
      this.onChanged})
      : super(key: key);

  final String label;
  final T selectItem;
  final ValueChanged<T?>? onChanged;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
        ),
        Container(
          height: 37,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: context.theme.comboBoxBorderColor, width: 1)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              onChanged: onChanged,
              borderRadius: BorderRadius.circular(5),
              icon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.expand_more,
                  color: context.theme.comboBoxActionColor,
                ),
              ),
              value: selectItem,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: context.theme.fontColor),
              items: items,
            ),
          ),
        ),
      ],
    );
  }
}

class Forms {
  static BuildContext? _contextForm;

  static show(
    BuildContext context, {
    void Function()? onClose,
    bool rootNavigation = true,
  }) {
    _contextForm = context;
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      context: context,
      isScrollControlled: true,
      useRootNavigator: rootNavigation,
      builder: (context) {
        return const FilterForm();
      },
    ).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  static close([bool rootNavigation = true]) {
    if (_contextForm != null) {
      Navigator.of(_contextForm!, rootNavigator: rootNavigation).pop();
      _contextForm = null;
    }
  }
}
