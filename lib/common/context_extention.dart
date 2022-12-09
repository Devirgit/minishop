import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/local.dart';
import 'package:minishop/common/theme/colors.dart';

extension BuildContextTheme on BuildContext {
  Local get loc => Local.of(this)!;

  AppColors get theme => Theme.of(this).extension<AppColors>()!;
}
