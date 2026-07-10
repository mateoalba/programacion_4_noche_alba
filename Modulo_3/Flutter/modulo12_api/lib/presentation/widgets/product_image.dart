import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../core/config/app_config.dart';

class ProductImage extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final double borderRadius;

  const ProductImage({
    super.key,
    this.imageUrl,
    this.height = 240,
    this.width = double.infinity,
    this.borderRadius = 0,
  });

  String? get _absoluteUrl => AppConfig.resolveImageUrl(imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: _absoluteUrl != null
            ? CachedNetworkImage(
                imageUrl: _absoluteUrl!,
                fit: BoxFit.cover,
                placeholder: (_, __) => _ShimmerEffect(height: height),
                errorWidget: (_, __, ___) => _Fallback(),
              )
            : _Fallback(),
      ),
    );
  }
}

class _ShimmerEffect extends StatefulWidget {
  final double height;
  const _ShimmerEffect({required this.height});

  @override
  State<_ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<_ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => Container(
        height: widget.height,
        color: AppColors.surface2.withValues(alpha: _animation.value),
      ),
    );
  }
}

class _Fallback extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.surface2,
    child: const Center(
      child: Text('📦', style: TextStyle(fontSize: 72)),
    ),
  );
}
