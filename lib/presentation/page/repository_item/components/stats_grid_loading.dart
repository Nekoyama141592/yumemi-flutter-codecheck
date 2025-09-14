import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:yumemi_flutter_codecheck/application/theme/extensions/app_colors.dart';
import 'shimmer_components.dart';

class StatsGridLoading extends StatelessWidget {
  const StatsGridLoading({super.key, required this.appColors});

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    const itemCount = 4;
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        final scaleH = (size.height / 812).clamp(0.8, 1.3);
        final spacing = (constraints.maxWidth * 0.03).clamp(8.0, 16.0);
        final contentMinHeight = (16 * 2 + 40 + 8 + 24 + 6 + 14) * scaleH;
        final minTileHeight = contentMinHeight + 4 * scaleH;
        final tentativeCols = (constraints.maxWidth / 160).floor();
        final crossAxisCount = tentativeCols.clamp(1, 4);
        final tileWidth =
            (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
            crossAxisCount;
        final childAspectRatio = tileWidth / math.max(minTileHeight, 1);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(16 * scaleH),
              decoration: BoxDecoration(
                color: appColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: appColors.border, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerCircle(radius: 20 * scaleH),
                  SizedBox(height: 8 * scaleH),
                  ShimmerContainer(
                    height: 24 * scaleH,
                    width: 60 * scaleH,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                  SizedBox(height: 6 * scaleH),
                  ShimmerContainer(
                    height: 14 * scaleH,
                    width: 70 * scaleH,
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
