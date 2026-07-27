package com.shopapp.presentation.viewmodel;

import com.shopapp.domain.repository.CategoryRepository;
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
public final class CatalogViewModel_Factory implements Factory<CatalogViewModel> {
  private final Provider<ProductRepository> productRepositoryProvider;

  private final Provider<CategoryRepository> categoryRepositoryProvider;

  public CatalogViewModel_Factory(Provider<ProductRepository> productRepositoryProvider,
      Provider<CategoryRepository> categoryRepositoryProvider) {
    this.productRepositoryProvider = productRepositoryProvider;
    this.categoryRepositoryProvider = categoryRepositoryProvider;
  }

  @Override
  public CatalogViewModel get() {
    return newInstance(productRepositoryProvider.get(), categoryRepositoryProvider.get());
  }

  public static CatalogViewModel_Factory create(
      Provider<ProductRepository> productRepositoryProvider,
      Provider<CategoryRepository> categoryRepositoryProvider) {
    return new CatalogViewModel_Factory(productRepositoryProvider, categoryRepositoryProvider);
  }

  public static CatalogViewModel newInstance(ProductRepository productRepository,
      CategoryRepository categoryRepository) {
    return new CatalogViewModel(productRepository, categoryRepository);
  }
}
