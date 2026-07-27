package com.shopapp.presentation.viewmodel;

import com.shopapp.domain.repository.AuthRepository;
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
public final class ResetPasswordConfirmViewModel_Factory implements Factory<ResetPasswordConfirmViewModel> {
  private final Provider<AuthRepository> repositoryProvider;

  public ResetPasswordConfirmViewModel_Factory(Provider<AuthRepository> repositoryProvider) {
    this.repositoryProvider = repositoryProvider;
  }

  @Override
  public ResetPasswordConfirmViewModel get() {
    return newInstance(repositoryProvider.get());
  }

  public static ResetPasswordConfirmViewModel_Factory create(
      Provider<AuthRepository> repositoryProvider) {
    return new ResetPasswordConfirmViewModel_Factory(repositoryProvider);
  }

  public static ResetPasswordConfirmViewModel newInstance(AuthRepository repository) {
    return new ResetPasswordConfirmViewModel(repository);
  }
}
