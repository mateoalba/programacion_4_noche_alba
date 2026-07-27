package com.shopapp.presentation.viewmodel;

import com.shopapp.domain.repository.CategoryRepository;
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
public final class CategoriesAdminViewModel_Factory implements Factory<CategoriesAdminViewModel> {
  private final Provider<CategoryRepository> repositoryProvider;

  public CategoriesAdminViewModel_Factory(Provider<CategoryRepository> repositoryProvider) {
    this.repositoryProvider = repositoryProvider;
  }

  @Override
  public CategoriesAdminViewModel get() {
    return newInstance(repositoryProvider.get());
  }

  public static CategoriesAdminViewModel_Factory create(
      Provider<CategoryRepository> repositoryProvider) {
    return new CategoriesAdminViewModel_Factory(repositoryProvider);
  }

  public static CategoriesAdminViewModel newInstance(CategoryRepository repository) {
    return new CategoriesAdminViewModel(repository);
  }
}
