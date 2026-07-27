package com.shopapp.data.repository;

import com.shopapp.data.remote.api.OrderApi;
import dagger.internal.DaggerGenerated;
import dagger.internal.Factory;
import dagger.internal.QualifierMetadata;
import dagger.internal.ScopeMetadata;
import javax.annotation.processing.Generated;
import javax.inject.Provider;

@ScopeMetadata("javax.inject.Singleton")
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
public final class OrderRepositoryImpl_Factory implements Factory<OrderRepositoryImpl> {
  private final Provider<OrderApi> apiProvider;

  public OrderRepositoryImpl_Factory(Provider<OrderApi> apiProvider) {
    this.apiProvider = apiProvider;
  }

  @Override
  public OrderRepositoryImpl get() {
    return newInstance(apiProvider.get());
  }

  public static OrderRepositoryImpl_Factory create(Provider<OrderApi> apiProvider) {
    return new OrderRepositoryImpl_Factory(apiProvider);
  }

  public static OrderRepositoryImpl newInstance(OrderApi api) {
    return new OrderRepositoryImpl(api);
  }
}
