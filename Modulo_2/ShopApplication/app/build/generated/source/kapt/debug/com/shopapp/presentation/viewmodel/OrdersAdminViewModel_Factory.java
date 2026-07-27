package com.shopapp.presentation.viewmodel;

import com.shopapp.domain.repository.OrderRepository;
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
public final class OrdersAdminViewModel_Factory implements Factory<OrdersAdminViewModel> {
  private final Provider<OrderRepository> repositoryProvider;

  public OrdersAdminViewModel_Factory(Provider<OrderRepository> repositoryProvider) {
    this.repositoryProvider = repositoryProvider;
  }

  @Override
  public OrdersAdminViewModel get() {
    return newInstance(repositoryProvider.get());
  }

  public static OrdersAdminViewModel_Factory create(Provider<OrderRepository> repositoryProvider) {
    return new OrdersAdminViewModel_Factory(repositoryProvider);
  }

  public static OrdersAdminViewModel newInstance(OrderRepository repository) {
    return new OrdersAdminViewModel(repository);
  }
}
