import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/config/app_config.dart';
import '../../core/utils/formatters.dart';
import '../../domain/model/product.dart';
import '../../theme/app_colors.dart';
import '../providers/cart_provider.dart';

class _ImagePlaceholder extends StatelessWidget {
  final double size;
  const _ImagePlaceholder({this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      color: AppColors.surface2,
      child: Icon(Icons.image_outlined, size: size * 0.35, color: AppColors.textFaint),
    );
  }
}

class ProductCard extends ConsumerWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tt = Theme.of(context).textTheme;
    final imageUrl = product.imageUrl != null
        ? '${AppConfig.baseUrl}${product.imageUrl}'
        : null;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => const _ImagePlaceholder(size: double.infinity),
                      errorWidget: (_, __, ___) => const _ImagePlaceholder(size: double.infinity),
                    )
                  : const _ImagePlaceholder(size: double.infinity),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: tt.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            formatPrice(product.price),
                            style: tt.titleMedium?.copyWith(color: AppColors.accent),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => ref.read(cartProvider.notifier).addItem(product),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.add_shopping_cart, size: 18, color: AppColors.accent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
