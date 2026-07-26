abstract class CatalogRepository {
  Future<List<Product>> getProducts({String? categoryId});
  Future<Product> getProductById(String id);
  Future<List<Category>> getCategories();
}
