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
public final class OrderDetailViewModel_Factory implements Factory<OrderDetailViewModel> {
  private final Provider<OrderRepository> repositoryProvider;

  public OrderDetailViewModel_Factory(Provider<OrderRepository> repositoryProvider) {
    this.repositoryProvider = repositoryProvider;
  }

  @Override
  public OrderDetailViewModel get() {
    return newInstance(repositoryProvider.get());
  }

  public static OrderDetailViewModel_Factory create(Provider<OrderRepository> repositoryProvider) {
    return new OrderDetailViewModel_Factory(repositoryProvider);
  }

  public static OrderDetailViewModel newInstance(OrderRepository repository) {
    return new OrderDetailViewModel(repository);
  }
}
