package com.shopapp.data.repository;

import android.content.Context;
import com.shopapp.data.remote.api.UserApi;
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
public final class UserRepositoryImpl_Factory implements Factory<UserRepositoryImpl> {
  private final Provider<UserApi> apiProvider;

  private final Provider<Context> contextProvider;

  public UserRepositoryImpl_Factory(Provider<UserApi> apiProvider,
      Provider<Context> contextProvider) {
    this.apiProvider = apiProvider;
    this.contextProvider = contextProvider;
  }

  @Override
  public UserRepositoryImpl get() {
    return newInstance(apiProvider.get(), contextProvider.get());
  }

  public static UserRepositoryImpl_Factory create(Provider<UserApi> apiProvider,
      Provider<Context> contextProvider) {
    return new UserRepositoryImpl_Factory(apiProvider, contextProvider);
  }

  public static UserRepositoryImpl newInstance(UserApi api, Context context) {
    return new UserRepositoryImpl(api, context);
  }
}
