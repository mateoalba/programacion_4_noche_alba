package com.shopapp.presentation.viewmodel;

import com.shopapp.domain.repository.CategoryRepository;
import com.shopapp.domain.repository.OrderRepository;
import com.shopapp.domain.repository.ProductRepository;
import com.shopapp.domain.repository.UserRepository;
import dagger.internal.DaggerGenerated;
import dagger.internal.Factory;
import dagger.internal.QualifierMetadata;
import dagger.internal.ScopeMetadata;
import javax.annotation.processing.Generated;
import javax.inject.Provider;

@ScopeMetadata
@QualifierMetadata
@DaggerGenerated
@Generated(
    value = "dagger.internal.codegen.ComponentProcessor",
    comments = "https://dagger.dev"
)
@SuppressWarnings({
    "unchecked",
    "rawtypes",
    "KotlinInternal",
    "KotlinInternalInJava",
    "cast",
    "deprecation"
})
public final class DashboardViewModel_Factory implements Factory<DashboardViewModel> {
  private final Provider<ProductRepository> productRepositoryProvider;

  private final Provider<CategoryRepository> categoryRepositoryProvider;

  private final Provider<OrderRepository> orderRepositoryProvider;

  private final Provider<UserRepository> userRepositoryProvider;

  public DashboardViewModel_Factory(Provider<ProductRepository> productRepositoryProvider,
      Provider<CategoryRepository> categoryRepositoryProvider,
      Provider<OrderRepository> orderRepositoryProvider,
      Provider<UserRepository> userRepositoryProvider) {
    this.productRepositoryProvider = productRepositoryProvider;
    this.categoryRepositoryProvider = categoryRepositoryProvider;
    this.orderRepositoryProvider = orderRepositoryProvider;
    this.userRepositoryProvider = userRepositoryProvider;
  }

  @Override
  public DashboardViewModel get() {
    return newInstance(productRepositoryProvider.get(), categoryRepositoryProvider.get(), orderRepositoryProvider.get(), userRepositoryProvider.get());
  }

  public static DashboardViewModel_Factory create(
      Provider<ProductRepository> productRepositoryProvider,
      Provider<CategoryRepository> categoryRepositoryProvider,
      Provider<OrderRepository> orderRepositoryProvider,
      Provider<UserRepository> userRepositoryProvider) {
    return new DashboardViewModel_Factory(productRepositoryProvider, categoryRepositoryProvider, orderRepositoryProvider, userRepositoryProvider);
  }

  public static DashboardViewModel newInstance(ProductRepository productRepository,
      CategoryRepository categoryRepository, OrderRepository orderRepository,
      UserRepository userRepository) {
    return new DashboardViewModel(productRepository, categoryRepository, orderRepository, userRepository);
  }
}
