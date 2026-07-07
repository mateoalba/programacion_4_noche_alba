import 'producto.dart';

class ProductoDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const ProductoDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
    id:           json['id']                    as int,
    name:         json['title']                 as String? ?? '',
    price:        (json['price'] as num?)?.toString() ?? '0',
    isActive:     json['is_active']             as bool? ?? true,
    categoryName: (json['category']
                      as Map<String, dynamic>?)?['name'] as String?,
  );

  Producto toDomain() => Producto(
    id:        id,
    nombre:    name,
    precio:    double.tryParse(price) ?? 0,
    activo:    isActive,
    categoria: categoryName,
  );
}
