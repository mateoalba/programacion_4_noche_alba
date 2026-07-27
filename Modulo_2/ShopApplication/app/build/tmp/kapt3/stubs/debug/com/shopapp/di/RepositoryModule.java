package com.shopapp.di;

@dagger.Module()
@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\'\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\'J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\tH\'J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\fH\'J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u0005\u001a\u00020\u000fH\'J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0005\u001a\u00020\u0012H\'\u00a8\u0006\u0013"}, d2 = {"Lcom/shopapp/di/RepositoryModule;", "", "()V", "bindAuthRepository", "Lcom/shopapp/domain/repository/AuthRepository;", "impl", "Lcom/shopapp/data/repository/AuthRepositoryImpl;", "bindCategoryRepository", "Lcom/shopapp/domain/repository/CategoryRepository;", "Lcom/shopapp/data/repository/CategoryRepositoryImpl;", "bindOrderRepository", "Lcom/shopapp/domain/repository/OrderRepository;", "Lcom/shopapp/data/repository/OrderRepositoryImpl;", "bindProductRepository", "Lcom/shopapp/domain/repository/ProductRepository;", "Lcom/shopapp/data/repository/ProductRepositoryImpl;", "bindUserRepository", "Lcom/shopapp/domain/repository/UserRepository;", "Lcom/shopapp/data/repository/UserRepositoryImpl;", "app_debug"})
@dagger.hilt.InstallIn(value = {dagger.hilt.components.SingletonComponent.class})
public abstract class RepositoryModule {
    
    public RepositoryModule() {
        super();
    }
    
    @dagger.Binds()
    @javax.inject.Singleton()
    @org.jetbrains.annotations.NotNull()
    public abstract com.shopapp.domain.repository.AuthRepository bindAuthRepository(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.repository.AuthRepositoryImpl impl);
    
    @dagger.Binds()
    @javax.inject.Singleton()
    @org.jetbrains.annotations.NotNull()
    public abstract com.shopapp.domain.repository.CategoryRepository bindCategoryRepository(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.repository.CategoryRepositoryImpl impl);
    
    @dagger.Binds()
    @javax.inject.Singleton()
    @org.jetbrains.annotations.NotNull()
    public abstract com.shopapp.domain.repository.ProductRepository bindProductRepository(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.repository.ProductRepositoryImpl impl);
    
    @dagger.Binds()
    @javax.inject.Singleton()
    @org.jetbrains.annotations.NotNull()
    public abstract com.shopapp.domain.repository.OrderRepository bindOrderRepository(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.repository.OrderRepositoryImpl impl);
    
    @dagger.Binds()
    @javax.inject.Singleton()
    @org.jetbrains.annotations.NotNull()
    public abstract com.shopapp.domain.repository.UserRepository bindUserRepository(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.repository.UserRepositoryImpl impl);
}