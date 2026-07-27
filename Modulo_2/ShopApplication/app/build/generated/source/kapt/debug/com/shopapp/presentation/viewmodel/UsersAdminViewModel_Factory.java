package com.shopapp.presentation.viewmodel;

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
public final class UsersAdminViewModel_Factory implements Factory<UsersAdminViewModel> {
  private final Provider<UserRepository> repositoryProvider;

  public UsersAdminViewModel_Factory(Provider<UserRepository> repositoryProvider) {
    this.repositoryProvider = repositoryProvider;
  }

  @Override
  public UsersAdminViewModel get() {
    return newInstance(repositoryProvider.get());
  }

  public static UsersAdminViewModel_Factory create(Provider<UserRepository> repositoryProvider) {
    return new UsersAdminViewModel_Factory(repositoryProvider);
  }

  public static UsersAdminViewModel newInstance(UserRepository repository) {
    return new UsersAdminViewModel(repository);
  }
}
