import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'shimmer_components.dart';

class ActionButtonsLoading extends StatelessWidget {
  const ActionButtonsLoading({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20 * scaleH),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
      ),
      child: ShimmerContainer(
        height: 52 * scaleH,
        width: double.infinity,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
