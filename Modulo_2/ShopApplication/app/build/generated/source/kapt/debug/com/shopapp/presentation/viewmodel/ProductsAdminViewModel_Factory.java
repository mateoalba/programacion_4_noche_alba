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
public final class ProductsAdminViewModel_Factory implements Factory<ProductsAdminViewModel> {
  private final Provider<ProductRepository> repositoryProvider;

  private final Provider<CategoryRepository> categoryRepositoryProvider;

  public ProductsAdminViewModel_Factory(Provider<ProductRepository> repositoryProvider,
      Provider<CategoryRepository> categoryRepositoryProvider) {
    this.repositoryProvider = repositoryProvider;
    this.categoryRepositoryProvider = categoryRepositoryProvider;
  }

  @Override
  public ProductsAdminViewModel get() {
    return newInstance(repositoryProvider.get(), categoryRepositoryProvider.get());
  }

  public static ProductsAdminViewModel_Factory create(
      Provider<ProductRepository> repositoryProvider,
      Provider<CategoryRepository> categoryRepositoryProvider) {
    return new ProductsAdminViewModel_Factory(repositoryProvider, categoryRepositoryProvider);
  }

  public static ProductsAdminViewModel newInstance(ProductRepository repository,
      CategoryRepository categoryRepository) {
    return new ProductsAdminViewModel(repository, categoryRepository);
  }
}
