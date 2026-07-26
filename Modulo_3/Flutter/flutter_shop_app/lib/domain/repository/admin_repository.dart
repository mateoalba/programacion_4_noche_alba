abstract class AdminRepository {
  Future<List<Order>> getAllOrders();
  Future<void> updateOrderStatus(String orderId, String status);
  Future<List<User>> getAllUsers();
  Future<void> deleteUser(String userId);
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String productId);
  Future<void> createCategory(Category category);
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory(String categoryId);
}
