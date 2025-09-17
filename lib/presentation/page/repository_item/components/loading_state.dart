import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'header_card_loading.dart';
import 'stats_grid_loading.dart';
import 'action_buttons_loading.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    required this.appColors,
    required this.isLandscape,
  });

  final AppColors appColors;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    final gap = 20.0 * scaleH;

    if (isLandscape) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: HeaderCardLoading(appColors: appColors)),
              SizedBox(width: gap),
              Expanded(child: StatsGridLoading(appColors: appColors)),
            ],
          ),
          SizedBox(height: gap),
          ActionButtonsLoading(appColors: appColors),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderCardLoading(appColors: appColors),
        SizedBox(height: gap),
        StatsGridLoading(appColors: appColors),
        SizedBox(height: gap),
        ActionButtonsLoading(appColors: appColors),
      ],
    );
  }
}
