import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/product_remote_datasource.dart';
import '../../data/repository/category_repository_impl.dart';
import '../../domain/model/category.dart';
import '../../domain/model/product.dart';

class CatalogState {
  final List<Product> products;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final bool hasMore;
  final int currentPage;
  final String search;
  final int? categoryId;
  final String ordering;

  const CatalogState({
    this.products = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.hasMore = true,
    this.currentPage = 1,
    this.search = '',
    this.categoryId,
    this.ordering = '-created_at',
  });

  CatalogState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    bool? hasMore,
    int? currentPage,
    String? search,
    int? categoryId,
    String? ordering,
  }) =>
      CatalogState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        error: error,
        hasMore: hasMore ?? this.hasMore,
        currentPage: currentPage ?? this.currentPage,
        search: search ?? this.search,
        categoryId: categoryId ?? this.categoryId,
        ordering: ordering ?? this.ordering,
      );
}

class CatalogNotifier extends StateNotifier<CatalogState> {
  final ProductRemoteDatasource _datasource;

  CatalogNotifier(this._datasource) : super(const CatalogState());

  Future<void> loadProducts({bool append = false}) async {
    final page = append ? state.currentPage + 1 : 1;

    if (append) {
      state = state.copyWith(isLoadingMore: true, error: null);
    } else {
      state = state.copyWith(isLoading: true, error: null, currentPage: 1);
    }

    try {
      final result = await _datasource.getProducts(
        search: state.search.isNotEmpty ? state.search : null,
        category: state.categoryId,
        ordering: state.ordering,
        page: page,
        pageSize: 12,
      );

      final allProducts = append
          ? [...state.products, ...result.results]
          : result.results;

      state = state.copyWith(
        products: allProducts,
        isLoading: false,
        isLoadingMore: false,
        hasMore: result.next != null,
        currentPage: page,
      );
    } on Exception catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: e.toString(),
      );
    }
  }

  void searchProducts(String query) {
    state = state.copyWith(search: query, products: [], currentPage: 1, hasMore: true);
    loadProducts();
  }

  void filterByCategory(int? id) {
    state = state.copyWith(categoryId: id, products: [], currentPage: 1, hasMore: true);
    loadProducts();
  }

  void sortBy(String field) {
    state = state.copyWith(ordering: field, products: [], currentPage: 1, hasMore: true);
    loadProducts();
  }

  void loadMore() {
    if (!state.isLoadingMore && state.hasMore) {
      loadProducts(append: true);
    }
  }
}

final catalogProvider = StateNotifierProvider<CatalogNotifier, CatalogState>((ref) {
  final datasource = ref.watch(productDatasourceProvider);
  return CatalogNotifier(datasource);
});

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final repo = ref.watch(categoryRepositoryProvider);
  return repo.getCategories();
});

final productDetailProvider = FutureProvider.family<Product, int>((ref, id) async {
  final datasource = ref.watch(productDatasourceProvider);
  return datasource.getProduct(id);
});
