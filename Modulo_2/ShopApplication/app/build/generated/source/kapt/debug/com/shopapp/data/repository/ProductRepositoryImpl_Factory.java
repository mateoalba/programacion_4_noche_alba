package com.shopapp.data.repository;

import android.content.Context;
import com.shopapp.data.remote.api.ProductApi;
import dagger.internal.DaggerGenerated;
import dagger.internal.Factory;
import dagger.internal.QualifierMetadata;
import dagger.internal.ScopeMetadata;
import javax.annotation.processing.Generated;
import javax.inject.Provider;

@ScopeMetadata("javax.inject.Singleton")
@QualifierMetadata("dagger.hilt.android.qualifiers.ApplicationContext")
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
public final class ProductRepositoryImpl_Factory implements Factory<ProductRepositoryImpl> {
  private final Provider<ProductApi> apiProvider;

  private final Provider<Context> contextProvider;

  public ProductRepositoryImpl_Factory(Provider<ProductApi> apiProvider,
      Provider<Context> contextProvider) {
    this.apiProvider = apiProvider;
    this.contextProvider = contextProvider;
  }

  @Override
  public ProductRepositoryImpl get() {
    return newInstance(apiProvider.get(), contextProvider.get());
  }

  public static ProductRepositoryImpl_Factory create(Provider<ProductApi> apiProvider,
      Provider<Context> contextProvider) {
    return new ProductRepositoryImpl_Factory(apiProvider, contextProvider);
  }

  public static ProductRepositoryImpl newInstance(ProductApi api, Context context) {
    return new ProductRepositoryImpl(api, context);
  }
}
