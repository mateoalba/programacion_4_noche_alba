package com.shopapp.presentation.viewmodel;

import com.shopapp.domain.repository.ProductRepository;
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
public final class ProductImageViewModel_Factory implements Factory<ProductImageViewModel> {
  private final Provider<ProductRepository> repositoryProvider;

  public ProductImageViewModel_Factory(Provider<ProductRepository> repositoryProvider) {
    this.repositoryProvider = repositoryProvider;
  }

  @Override
  public ProductImageViewModel get() {
    return newInstance(repositoryProvider.get());
  }

  public static ProductImageViewModel_Factory create(
      Provider<ProductRepository> repositoryProvider) {
    return new ProductImageViewModel_Factory(repositoryProvider);
  }

  public static ProductImageViewModel newInstance(ProductRepository repository) {
    return new ProductImageViewModel(repository);
  }
}
