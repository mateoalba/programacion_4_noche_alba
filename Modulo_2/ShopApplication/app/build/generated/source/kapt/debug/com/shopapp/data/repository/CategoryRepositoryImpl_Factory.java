package com.shopapp.data.repository;

import com.shopapp.data.remote.api.CategoryApi;
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
public final class CategoryRepositoryImpl_Factory implements Factory<CategoryRepositoryImpl> {
  private final Provider<CategoryApi> apiProvider;

  public CategoryRepositoryImpl_Factory(Provider<CategoryApi> apiProvider) {
    this.apiProvider = apiProvider;
  }

  @Override
  public CategoryRepositoryImpl get() {
    return newInstance(apiProvider.get());
  }

  public static CategoryRepositoryImpl_Factory create(Provider<CategoryApi> apiProvider) {
    return new CategoryRepositoryImpl_Factory(apiProvider);
  }

  public static CategoryRepositoryImpl newInstance(CategoryApi api) {
    return new CategoryRepositoryImpl(api);
  }
}
