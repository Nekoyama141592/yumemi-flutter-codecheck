import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'shimmer_components.dart';

class HeaderCardLoading extends StatelessWidget {
  const HeaderCardLoading({super.key, required this.appColors});
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaleH = (size.height / 812).clamp(0.8, 1.3);
    final pad = 24.0 * scaleH;
    final gapM = 16.0 * scaleH;
    final gapS = 12.0 * scaleH;
    final titleH = 28.0 * scaleH;
    final chipH = 28.0 * scaleH;
    final chipW = 80.0 * scaleH;
    final avatarR = 40.0 * scaleH;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(pad),
      decoration: BoxDecoration(
        color: appColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: appColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: appColors.onSurface.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ShimmerCircle(radius: avatarR),
          SizedBox(height: gapM),
          ShimmerContainer(
            height: titleH,
            width: 200 * scaleH,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          SizedBox(height: gapS),
          ShimmerContainer(
            height: chipH,
            width: chipW,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
        ],
      ),
    );
  }
}
