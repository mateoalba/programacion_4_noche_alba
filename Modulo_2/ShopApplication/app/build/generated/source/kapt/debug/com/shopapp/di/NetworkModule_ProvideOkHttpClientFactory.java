package com.shopapp.di;

import com.shopapp.data.local.TokenDataStore;
import com.shopapp.data.remote.interceptor.AuthInterceptor;
import dagger.internal.DaggerGenerated;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import dagger.internal.QualifierMetadata;
import dagger.internal.ScopeMetadata;
import javax.annotation.processing.Generated;
import javax.inject.Provider;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;

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
public final class NetworkModule_ProvideOkHttpClientFactory implements Factory<OkHttpClient> {
  private final Provider<TokenDataStore> tokenDataStoreProvider;

  private final Provider<AuthInterceptor> authInterceptorProvider;

  private final Provider<HttpLoggingInterceptor> loggingProvider;

  public NetworkModule_ProvideOkHttpClientFactory(Provider<TokenDataStore> tokenDataStoreProvider,
      Provider<AuthInterceptor> authInterceptorProvider,
      Provider<HttpLoggingInterceptor> loggingProvider) {
    this.tokenDataStoreProvider = tokenDataStoreProvider;
    this.authInterceptorProvider = authInterceptorProvider;
    this.loggingProvider = loggingProvider;
  }

  @Override
  public OkHttpClient get() {
    return provideOkHttpClient(tokenDataStoreProvider.get(), authInterceptorProvider.get(), loggingProvider.get());
  }

  public static NetworkModule_ProvideOkHttpClientFactory create(
      Provider<TokenDataStore> tokenDataStoreProvider,
      Provider<AuthInterceptor> authInterceptorProvider,
      Provider<HttpLoggingInterceptor> loggingProvider) {
    return new NetworkModule_ProvideOkHttpClientFactory(tokenDataStoreProvider, authInterceptorProvider, loggingProvider);
  }

  public static OkHttpClient provideOkHttpClient(TokenDataStore tokenDataStore,
      AuthInterceptor authInterceptor, HttpLoggingInterceptor logging) {
    return Preconditions.checkNotNullFromProvides(NetworkModule.INSTANCE.provideOkHttpClient(tokenDataStore, authInterceptor, logging));
  }
}
