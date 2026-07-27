package com.shopapp;

import android.app.Activity;
import android.app.Service;
import android.view.View;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.SavedStateHandle;
import androidx.lifecycle.ViewModel;
import com.shopapp.data.local.TokenDataStore;
import com.shopapp.data.remote.api.AuthApi;
import com.shopapp.data.remote.api.CategoryApi;
import com.shopapp.data.remote.api.OrderApi;
import com.shopapp.data.remote.api.ProductApi;
import com.shopapp.data.remote.api.UserApi;
import com.shopapp.data.remote.interceptor.AuthInterceptor;
import com.shopapp.data.repository.AuthRepositoryImpl;
import com.shopapp.data.repository.CategoryRepositoryImpl;
import com.shopapp.data.repository.OrderRepositoryImpl;
import com.shopapp.data.repository.ProductRepositoryImpl;
import com.shopapp.data.repository.UserRepositoryImpl;
import com.shopapp.di.NetworkModule_ProvideAuthApiFactory;
import com.shopapp.di.NetworkModule_ProvideCategoryApiFactory;
import com.shopapp.di.NetworkModule_ProvideLoggingInterceptorFactory;
import com.shopapp.di.NetworkModule_ProvideOkHttpClientFactory;
import com.shopapp.di.NetworkModule_ProvideOrderApiFactory;
import com.shopapp.di.NetworkModule_ProvideProductApiFactory;
import com.shopapp.di.NetworkModule_ProvideRetrofitFactory;
import com.shopapp.di.NetworkModule_ProvideUserApiFactory;
import com.shopapp.presentation.ui.uipublic.product.ProductDetailViewModel;
import com.shopapp.presentation.ui.uipublic.product.ProductDetailViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.AuthViewModel;
import com.shopapp.presentation.viewmodel.AuthViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.CartViewModel;
import com.shopapp.presentation.viewmodel.CartViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.CatalogViewModel;
import com.shopapp.presentation.viewmodel.CatalogViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.CategoriesAdminViewModel;
import com.shopapp.presentation.viewmodel.CategoriesAdminViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.DashboardViewModel;
import com.shopapp.presentation.viewmodel.DashboardViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.ForgotPasswordViewModel;
import com.shopapp.presentation.viewmodel.ForgotPasswordViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.OrderDetailViewModel;
import com.shopapp.presentation.viewmodel.OrderDetailViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.OrdersAdminViewModel;
import com.shopapp.presentation.viewmodel.OrdersAdminViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.OrdersViewModel;
import com.shopapp.presentation.viewmodel.OrdersViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.ProductImageViewModel;
import com.shopapp.presentation.viewmodel.ProductImageViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.ProductsAdminViewModel;
import com.shopapp.presentation.viewmodel.ProductsAdminViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.ProfileViewModel;
import com.shopapp.presentation.viewmodel.ProfileViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.ResetPasswordConfirmViewModel;
import com.shopapp.presentation.viewmodel.ResetPasswordConfirmViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.SendNotificationViewModel;
import com.shopapp.presentation.viewmodel.SendNotificationViewModel_HiltModules;
import com.shopapp.presentation.viewmodel.UsersAdminViewModel;
import com.shopapp.presentation.viewmodel.UsersAdminViewModel_HiltModules;
import dagger.hilt.android.ActivityRetainedLifecycle;
import dagger.hilt.android.ViewModelLifecycle;
import dagger.hilt.android.internal.builders.ActivityComponentBuilder;
import dagger.hilt.android.internal.builders.ActivityRetainedComponentBuilder;
import dagger.hilt.android.internal.builders.FragmentComponentBuilder;
import dagger.hilt.android.internal.builders.ServiceComponentBuilder;
import dagger.hilt.android.internal.builders.ViewComponentBuilder;
import dagger.hilt.android.internal.builders.ViewModelComponentBuilder;
import dagger.hilt.android.internal.builders.ViewWithFragmentComponentBuilder;
import dagger.hilt.android.internal.lifecycle.DefaultViewModelFactories;
import dagger.hilt.android.internal.lifecycle.DefaultViewModelFactories_InternalFactoryFactory_Factory;
import dagger.hilt.android.internal.managers.ActivityRetainedComponentManager_LifecycleModule_ProvideActivityRetainedLifecycleFactory;
import dagger.hilt.android.internal.managers.SavedStateHandleHolder;
import dagger.hilt.android.internal.modules.ApplicationContextModule;
import dagger.hilt.android.internal.modules.ApplicationContextModule_ProvideContextFactory;
import dagger.internal.DaggerGenerated;
import dagger.internal.DoubleCheck;
import dagger.internal.IdentifierNameString;
import dagger.internal.KeepFieldType;
import dagger.internal.LazyClassKeyMap;
import dagger.internal.MapBuilder;
import dagger.internal.Preconditions;
import dagger.internal.Provider;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import javax.annotation.processing.Generated;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;

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
public final class DaggerShopApplication_HiltComponents_SingletonC {
  private DaggerShopApplication_HiltComponents_SingletonC() {
  }

  public static Builder builder() {
    return new Builder();
  }

  public static final class Builder {
    private ApplicationContextModule applicationContextModule;

    private Builder() {
    }

    public Builder applicationContextModule(ApplicationContextModule applicationContextModule) {
      this.applicationContextModule = Preconditions.checkNotNull(applicationContextModule);
      return this;
    }

    public ShopApplication_HiltComponents.SingletonC build() {
      Preconditions.checkBuilderRequirement(applicationContextModule, ApplicationContextModule.class);
      return new SingletonCImpl(applicationContextModule);
    }
  }

  private static final class ActivityRetainedCBuilder implements ShopApplication_HiltComponents.ActivityRetainedC.Builder {
    private final SingletonCImpl singletonCImpl;

    private SavedStateHandleHolder savedStateHandleHolder;

    private ActivityRetainedCBuilder(SingletonCImpl singletonCImpl) {
      this.singletonCImpl = singletonCImpl;
    }

    @Override
    public ActivityRetainedCBuilder savedStateHandleHolder(
        SavedStateHandleHolder savedStateHandleHolder) {
      this.savedStateHandleHolder = Preconditions.checkNotNull(savedStateHandleHolder);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.ActivityRetainedC build() {
      Preconditions.checkBuilderRequirement(savedStateHandleHolder, SavedStateHandleHolder.class);
      return new ActivityRetainedCImpl(singletonCImpl, savedStateHandleHolder);
    }
  }

  private static final class ActivityCBuilder implements ShopApplication_HiltComponents.ActivityC.Builder {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private Activity activity;

    private ActivityCBuilder(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
    }

    @Override
    public ActivityCBuilder activity(Activity activity) {
      this.activity = Preconditions.checkNotNull(activity);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.ActivityC build() {
      Preconditions.checkBuilderRequirement(activity, Activity.class);
      return new ActivityCImpl(singletonCImpl, activityRetainedCImpl, activity);
    }
  }

  private static final class FragmentCBuilder implements ShopApplication_HiltComponents.FragmentC.Builder {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl;

    private Fragment fragment;

    private FragmentCBuilder(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl, ActivityCImpl activityCImpl) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
      this.activityCImpl = activityCImpl;
    }

    @Override
    public FragmentCBuilder fragment(Fragment fragment) {
      this.fragment = Preconditions.checkNotNull(fragment);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.FragmentC build() {
      Preconditions.checkBuilderRequirement(fragment, Fragment.class);
      return new FragmentCImpl(singletonCImpl, activityRetainedCImpl, activityCImpl, fragment);
    }
  }

  private static final class ViewWithFragmentCBuilder implements ShopApplication_HiltComponents.ViewWithFragmentC.Builder {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl;

    private final FragmentCImpl fragmentCImpl;

    private View view;

    private ViewWithFragmentCBuilder(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl, ActivityCImpl activityCImpl,
        FragmentCImpl fragmentCImpl) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
      this.activityCImpl = activityCImpl;
      this.fragmentCImpl = fragmentCImpl;
    }

    @Override
    public ViewWithFragmentCBuilder view(View view) {
      this.view = Preconditions.checkNotNull(view);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.ViewWithFragmentC build() {
      Preconditions.checkBuilderRequirement(view, View.class);
      return new ViewWithFragmentCImpl(singletonCImpl, activityRetainedCImpl, activityCImpl, fragmentCImpl, view);
    }
  }

  private static final class ViewCBuilder implements ShopApplication_HiltComponents.ViewC.Builder {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl;

    private View view;

    private ViewCBuilder(SingletonCImpl singletonCImpl, ActivityRetainedCImpl activityRetainedCImpl,
        ActivityCImpl activityCImpl) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
      this.activityCImpl = activityCImpl;
    }

    @Override
    public ViewCBuilder view(View view) {
      this.view = Preconditions.checkNotNull(view);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.ViewC build() {
      Preconditions.checkBuilderRequirement(view, View.class);
      return new ViewCImpl(singletonCImpl, activityRetainedCImpl, activityCImpl, view);
    }
  }

  private static final class ViewModelCBuilder implements ShopApplication_HiltComponents.ViewModelC.Builder {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private SavedStateHandle savedStateHandle;

    private ViewModelLifecycle viewModelLifecycle;

    private ViewModelCBuilder(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
    }

    @Override
    public ViewModelCBuilder savedStateHandle(SavedStateHandle handle) {
      this.savedStateHandle = Preconditions.checkNotNull(handle);
      return this;
    }

    @Override
    public ViewModelCBuilder viewModelLifecycle(ViewModelLifecycle viewModelLifecycle) {
      this.viewModelLifecycle = Preconditions.checkNotNull(viewModelLifecycle);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.ViewModelC build() {
      Preconditions.checkBuilderRequirement(savedStateHandle, SavedStateHandle.class);
      Preconditions.checkBuilderRequirement(viewModelLifecycle, ViewModelLifecycle.class);
      return new ViewModelCImpl(singletonCImpl, activityRetainedCImpl, savedStateHandle, viewModelLifecycle);
    }
  }

  private static final class ServiceCBuilder implements ShopApplication_HiltComponents.ServiceC.Builder {
    private final SingletonCImpl singletonCImpl;

    private Service service;

    private ServiceCBuilder(SingletonCImpl singletonCImpl) {
      this.singletonCImpl = singletonCImpl;
    }

    @Override
    public ServiceCBuilder service(Service service) {
      this.service = Preconditions.checkNotNull(service);
      return this;
    }

    @Override
    public ShopApplication_HiltComponents.ServiceC build() {
      Preconditions.checkBuilderRequirement(service, Service.class);
      return new ServiceCImpl(singletonCImpl, service);
    }
  }

  private static final class ViewWithFragmentCImpl extends ShopApplication_HiltComponents.ViewWithFragmentC {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl;

    private final FragmentCImpl fragmentCImpl;

    private final ViewWithFragmentCImpl viewWithFragmentCImpl = this;

    private ViewWithFragmentCImpl(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl, ActivityCImpl activityCImpl,
        FragmentCImpl fragmentCImpl, View viewParam) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
      this.activityCImpl = activityCImpl;
      this.fragmentCImpl = fragmentCImpl;


    }
  }

  private static final class FragmentCImpl extends ShopApplication_HiltComponents.FragmentC {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl;

    private final FragmentCImpl fragmentCImpl = this;

    private FragmentCImpl(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl, ActivityCImpl activityCImpl,
        Fragment fragmentParam) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
      this.activityCImpl = activityCImpl;


    }

    @Override
    public DefaultViewModelFactories.InternalFactoryFactory getHiltInternalFactoryFactory() {
      return activityCImpl.getHiltInternalFactoryFactory();
    }

    @Override
    public ViewWithFragmentComponentBuilder viewWithFragmentComponentBuilder() {
      return new ViewWithFragmentCBuilder(singletonCImpl, activityRetainedCImpl, activityCImpl, fragmentCImpl);
    }
  }

  private static final class ViewCImpl extends ShopApplication_HiltComponents.ViewC {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl;

    private final ViewCImpl viewCImpl = this;

    private ViewCImpl(SingletonCImpl singletonCImpl, ActivityRetainedCImpl activityRetainedCImpl,
        ActivityCImpl activityCImpl, View viewParam) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;
      this.activityCImpl = activityCImpl;


    }
  }

  private static final class ActivityCImpl extends ShopApplication_HiltComponents.ActivityC {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ActivityCImpl activityCImpl = this;

    private ActivityCImpl(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl, Activity activityParam) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;


    }

    @Override
    public void injectMainActivity(MainActivity arg0) {
    }

    @Override
    public DefaultViewModelFactories.InternalFactoryFactory getHiltInternalFactoryFactory() {
      return DefaultViewModelFactories_InternalFactoryFactory_Factory.newInstance(getViewModelKeys(), new ViewModelCBuilder(singletonCImpl, activityRetainedCImpl));
    }

    @Override
    public Map<Class<?>, Boolean> getViewModelKeys() {
      return LazyClassKeyMap.<Boolean>of(MapBuilder.<String, Boolean>newMapBuilder(16).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_AuthViewModel, AuthViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_CartViewModel, CartViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_CatalogViewModel, CatalogViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_CategoriesAdminViewModel, CategoriesAdminViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_DashboardViewModel, DashboardViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ForgotPasswordViewModel, ForgotPasswordViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_OrderDetailViewModel, OrderDetailViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_OrdersAdminViewModel, OrdersAdminViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_OrdersViewModel, OrdersViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_ui_uipublic_product_ProductDetailViewModel, ProductDetailViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ProductImageViewModel, ProductImageViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ProductsAdminViewModel, ProductsAdminViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ProfileViewModel, ProfileViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ResetPasswordConfirmViewModel, ResetPasswordConfirmViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_SendNotificationViewModel, SendNotificationViewModel_HiltModules.KeyModule.provide()).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_UsersAdminViewModel, UsersAdminViewModel_HiltModules.KeyModule.provide()).build());
    }

    @Override
    public ViewModelComponentBuilder getViewModelComponentBuilder() {
      return new ViewModelCBuilder(singletonCImpl, activityRetainedCImpl);
    }

    @Override
    public FragmentComponentBuilder fragmentComponentBuilder() {
      return new FragmentCBuilder(singletonCImpl, activityRetainedCImpl, activityCImpl);
    }

    @Override
    public ViewComponentBuilder viewComponentBuilder() {
      return new ViewCBuilder(singletonCImpl, activityRetainedCImpl, activityCImpl);
    }

    @IdentifierNameString
    private static final class LazyClassKeyProvider {
      static String com_shopapp_presentation_viewmodel_SendNotificationViewModel = "com.shopapp.presentation.viewmodel.SendNotificationViewModel";

      static String com_shopapp_presentation_viewmodel_ProductImageViewModel = "com.shopapp.presentation.viewmodel.ProductImageViewModel";

      static String com_shopapp_presentation_viewmodel_UsersAdminViewModel = "com.shopapp.presentation.viewmodel.UsersAdminViewModel";

      static String com_shopapp_presentation_viewmodel_CatalogViewModel = "com.shopapp.presentation.viewmodel.CatalogViewModel";

      static String com_shopapp_presentation_viewmodel_OrdersViewModel = "com.shopapp.presentation.viewmodel.OrdersViewModel";

      static String com_shopapp_presentation_viewmodel_OrderDetailViewModel = "com.shopapp.presentation.viewmodel.OrderDetailViewModel";

      static String com_shopapp_presentation_viewmodel_ResetPasswordConfirmViewModel = "com.shopapp.presentation.viewmodel.ResetPasswordConfirmViewModel";

      static String com_shopapp_presentation_viewmodel_ForgotPasswordViewModel = "com.shopapp.presentation.viewmodel.ForgotPasswordViewModel";

      static String com_shopapp_presentation_viewmodel_AuthViewModel = "com.shopapp.presentation.viewmodel.AuthViewModel";

      static String com_shopapp_presentation_ui_uipublic_product_ProductDetailViewModel = "com.shopapp.presentation.ui.uipublic.product.ProductDetailViewModel";

      static String com_shopapp_presentation_viewmodel_ProfileViewModel = "com.shopapp.presentation.viewmodel.ProfileViewModel";

      static String com_shopapp_presentation_viewmodel_DashboardViewModel = "com.shopapp.presentation.viewmodel.DashboardViewModel";

      static String com_shopapp_presentation_viewmodel_CartViewModel = "com.shopapp.presentation.viewmodel.CartViewModel";

      static String com_shopapp_presentation_viewmodel_CategoriesAdminViewModel = "com.shopapp.presentation.viewmodel.CategoriesAdminViewModel";

      static String com_shopapp_presentation_viewmodel_ProductsAdminViewModel = "com.shopapp.presentation.viewmodel.ProductsAdminViewModel";

      static String com_shopapp_presentation_viewmodel_OrdersAdminViewModel = "com.shopapp.presentation.viewmodel.OrdersAdminViewModel";

      @KeepFieldType
      SendNotificationViewModel com_shopapp_presentation_viewmodel_SendNotificationViewModel2;

      @KeepFieldType
      ProductImageViewModel com_shopapp_presentation_viewmodel_ProductImageViewModel2;

      @KeepFieldType
      UsersAdminViewModel com_shopapp_presentation_viewmodel_UsersAdminViewModel2;

      @KeepFieldType
      CatalogViewModel com_shopapp_presentation_viewmodel_CatalogViewModel2;

      @KeepFieldType
      OrdersViewModel com_shopapp_presentation_viewmodel_OrdersViewModel2;

      @KeepFieldType
      OrderDetailViewModel com_shopapp_presentation_viewmodel_OrderDetailViewModel2;

      @KeepFieldType
      ResetPasswordConfirmViewModel com_shopapp_presentation_viewmodel_ResetPasswordConfirmViewModel2;

      @KeepFieldType
      ForgotPasswordViewModel com_shopapp_presentation_viewmodel_ForgotPasswordViewModel2;

      @KeepFieldType
      AuthViewModel com_shopapp_presentation_viewmodel_AuthViewModel2;

      @KeepFieldType
      ProductDetailViewModel com_shopapp_presentation_ui_uipublic_product_ProductDetailViewModel2;

      @KeepFieldType
      ProfileViewModel com_shopapp_presentation_viewmodel_ProfileViewModel2;

      @KeepFieldType
      DashboardViewModel com_shopapp_presentation_viewmodel_DashboardViewModel2;

      @KeepFieldType
      CartViewModel com_shopapp_presentation_viewmodel_CartViewModel2;

      @KeepFieldType
      CategoriesAdminViewModel com_shopapp_presentation_viewmodel_CategoriesAdminViewModel2;

      @KeepFieldType
      ProductsAdminViewModel com_shopapp_presentation_viewmodel_ProductsAdminViewModel2;

      @KeepFieldType
      OrdersAdminViewModel com_shopapp_presentation_viewmodel_OrdersAdminViewModel2;
    }
  }

  private static final class ViewModelCImpl extends ShopApplication_HiltComponents.ViewModelC {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl;

    private final ViewModelCImpl viewModelCImpl = this;

    private Provider<AuthViewModel> authViewModelProvider;

    private Provider<CartViewModel> cartViewModelProvider;

    private Provider<CatalogViewModel> catalogViewModelProvider;

    private Provider<CategoriesAdminViewModel> categoriesAdminViewModelProvider;

    private Provider<DashboardViewModel> dashboardViewModelProvider;

    private Provider<ForgotPasswordViewModel> forgotPasswordViewModelProvider;

    private Provider<OrderDetailViewModel> orderDetailViewModelProvider;

    private Provider<OrdersAdminViewModel> ordersAdminViewModelProvider;

    private Provider<OrdersViewModel> ordersViewModelProvider;

    private Provider<ProductDetailViewModel> productDetailViewModelProvider;

    private Provider<ProductImageViewModel> productImageViewModelProvider;

    private Provider<ProductsAdminViewModel> productsAdminViewModelProvider;

    private Provider<ProfileViewModel> profileViewModelProvider;

    private Provider<ResetPasswordConfirmViewModel> resetPasswordConfirmViewModelProvider;

    private Provider<SendNotificationViewModel> sendNotificationViewModelProvider;

    private Provider<UsersAdminViewModel> usersAdminViewModelProvider;

    private ViewModelCImpl(SingletonCImpl singletonCImpl,
        ActivityRetainedCImpl activityRetainedCImpl, SavedStateHandle savedStateHandleParam,
        ViewModelLifecycle viewModelLifecycleParam) {
      this.singletonCImpl = singletonCImpl;
      this.activityRetainedCImpl = activityRetainedCImpl;

      initialize(savedStateHandleParam, viewModelLifecycleParam);

    }

    @SuppressWarnings("unchecked")
    private void initialize(final SavedStateHandle savedStateHandleParam,
        final ViewModelLifecycle viewModelLifecycleParam) {
      this.authViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 0);
      this.cartViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 1);
      this.catalogViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 2);
      this.categoriesAdminViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 3);
      this.dashboardViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 4);
      this.forgotPasswordViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 5);
      this.orderDetailViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 6);
      this.ordersAdminViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 7);
      this.ordersViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 8);
      this.productDetailViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 9);
      this.productImageViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 10);
      this.productsAdminViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 11);
      this.profileViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 12);
      this.resetPasswordConfirmViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 13);
      this.sendNotificationViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 14);
      this.usersAdminViewModelProvider = new SwitchingProvider<>(singletonCImpl, activityRetainedCImpl, viewModelCImpl, 15);
    }

    @Override
    public Map<Class<?>, javax.inject.Provider<ViewModel>> getHiltViewModelMap() {
      return LazyClassKeyMap.<javax.inject.Provider<ViewModel>>of(MapBuilder.<String, javax.inject.Provider<ViewModel>>newMapBuilder(16).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_AuthViewModel, ((Provider) authViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_CartViewModel, ((Provider) cartViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_CatalogViewModel, ((Provider) catalogViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_CategoriesAdminViewModel, ((Provider) categoriesAdminViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_DashboardViewModel, ((Provider) dashboardViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ForgotPasswordViewModel, ((Provider) forgotPasswordViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_OrderDetailViewModel, ((Provider) orderDetailViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_OrdersAdminViewModel, ((Provider) ordersAdminViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_OrdersViewModel, ((Provider) ordersViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_ui_uipublic_product_ProductDetailViewModel, ((Provider) productDetailViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ProductImageViewModel, ((Provider) productImageViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ProductsAdminViewModel, ((Provider) productsAdminViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ProfileViewModel, ((Provider) profileViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_ResetPasswordConfirmViewModel, ((Provider) resetPasswordConfirmViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_SendNotificationViewModel, ((Provider) sendNotificationViewModelProvider)).put(LazyClassKeyProvider.com_shopapp_presentation_viewmodel_UsersAdminViewModel, ((Provider) usersAdminViewModelProvider)).build());
    }

    @Override
    public Map<Class<?>, Object> getHiltViewModelAssistedMap() {
      return Collections.<Class<?>, Object>emptyMap();
    }

    @IdentifierNameString
    private static final class LazyClassKeyProvider {
      static String com_shopapp_presentation_viewmodel_OrdersViewModel = "com.shopapp.presentation.viewmodel.OrdersViewModel";

      static String com_shopapp_presentation_viewmodel_OrdersAdminViewModel = "com.shopapp.presentation.viewmodel.OrdersAdminViewModel";

      static String com_shopapp_presentation_viewmodel_CartViewModel = "com.shopapp.presentation.viewmodel.CartViewModel";

      static String com_shopapp_presentation_viewmodel_UsersAdminViewModel = "com.shopapp.presentation.viewmodel.UsersAdminViewModel";

      static String com_shopapp_presentation_viewmodel_CatalogViewModel = "com.shopapp.presentation.viewmodel.CatalogViewModel";

      static String com_shopapp_presentation_ui_uipublic_product_ProductDetailViewModel = "com.shopapp.presentation.ui.uipublic.product.ProductDetailViewModel";

      static String com_shopapp_presentation_viewmodel_ForgotPasswordViewModel = "com.shopapp.presentation.viewmodel.ForgotPasswordViewModel";

      static String com_shopapp_presentation_viewmodel_SendNotificationViewModel = "com.shopapp.presentation.viewmodel.SendNotificationViewModel";

      static String com_shopapp_presentation_viewmodel_ProfileViewModel = "com.shopapp.presentation.viewmodel.ProfileViewModel";

      static String com_shopapp_presentation_viewmodel_OrderDetailViewModel = "com.shopapp.presentation.viewmodel.OrderDetailViewModel";

      static String com_shopapp_presentation_viewmodel_ProductsAdminViewModel = "com.shopapp.presentation.viewmodel.ProductsAdminViewModel";

      static String com_shopapp_presentation_viewmodel_ProductImageViewModel = "com.shopapp.presentation.viewmodel.ProductImageViewModel";

      static String com_shopapp_presentation_viewmodel_ResetPasswordConfirmViewModel = "com.shopapp.presentation.viewmodel.ResetPasswordConfirmViewModel";

      static String com_shopapp_presentation_viewmodel_CategoriesAdminViewModel = "com.shopapp.presentation.viewmodel.CategoriesAdminViewModel";

      static String com_shopapp_presentation_viewmodel_AuthViewModel = "com.shopapp.presentation.viewmodel.AuthViewModel";

      static String com_shopapp_presentation_viewmodel_DashboardViewModel = "com.shopapp.presentation.viewmodel.DashboardViewModel";

      @KeepFieldType
      OrdersViewModel com_shopapp_presentation_viewmodel_OrdersViewModel2;

      @KeepFieldType
      OrdersAdminViewModel com_shopapp_presentation_viewmodel_OrdersAdminViewModel2;

      @KeepFieldType
      CartViewModel com_shopapp_presentation_viewmodel_CartViewModel2;

      @KeepFieldType
      UsersAdminViewModel com_shopapp_presentation_viewmodel_UsersAdminViewModel2;

      @KeepFieldType
      CatalogViewModel com_shopapp_presentation_viewmodel_CatalogViewModel2;

      @KeepFieldType
      ProductDetailViewModel com_shopapp_presentation_ui_uipublic_product_ProductDetailViewModel2;

      @KeepFieldType
      ForgotPasswordViewModel com_shopapp_presentation_viewmodel_ForgotPasswordViewModel2;

      @KeepFieldType
      SendNotificationViewModel com_shopapp_presentation_viewmodel_SendNotificationViewModel2;

      @KeepFieldType
      ProfileViewModel com_shopapp_presentation_viewmodel_ProfileViewModel2;

      @KeepFieldType
      OrderDetailViewModel com_shopapp_presentation_viewmodel_OrderDetailViewModel2;

      @KeepFieldType
      ProductsAdminViewModel com_shopapp_presentation_viewmodel_ProductsAdminViewModel2;

      @KeepFieldType
      ProductImageViewModel com_shopapp_presentation_viewmodel_ProductImageViewModel2;

      @KeepFieldType
      ResetPasswordConfirmViewModel com_shopapp_presentation_viewmodel_ResetPasswordConfirmViewModel2;

      @KeepFieldType
      CategoriesAdminViewModel com_shopapp_presentation_viewmodel_CategoriesAdminViewModel2;

      @KeepFieldType
      AuthViewModel com_shopapp_presentation_viewmodel_AuthViewModel2;

      @KeepFieldType
      DashboardViewModel com_shopapp_presentation_viewmodel_DashboardViewModel2;
    }

    private static final class SwitchingProvider<T> implements Provider<T> {
      private final SingletonCImpl singletonCImpl;

      private final ActivityRetainedCImpl activityRetainedCImpl;

      private final ViewModelCImpl viewModelCImpl;

      private final int id;

      SwitchingProvider(SingletonCImpl singletonCImpl, ActivityRetainedCImpl activityRetainedCImpl,
          ViewModelCImpl viewModelCImpl, int id) {
        this.singletonCImpl = singletonCImpl;
        this.activityRetainedCImpl = activityRetainedCImpl;
        this.viewModelCImpl = viewModelCImpl;
        this.id = id;
      }

      @SuppressWarnings("unchecked")
      @Override
      public T get() {
        switch (id) {
          case 0: // com.shopapp.presentation.viewmodel.AuthViewModel 
          return (T) new AuthViewModel(singletonCImpl.authRepositoryImplProvider.get(), singletonCImpl.tokenDataStoreProvider.get());

          case 1: // com.shopapp.presentation.viewmodel.CartViewModel 
          return (T) new CartViewModel(singletonCImpl.orderRepositoryImplProvider.get());

          case 2: // com.shopapp.presentation.viewmodel.CatalogViewModel 
          return (T) new CatalogViewModel(singletonCImpl.productRepositoryImplProvider.get(), singletonCImpl.categoryRepositoryImplProvider.get());

          case 3: // com.shopapp.presentation.viewmodel.CategoriesAdminViewModel 
          return (T) new CategoriesAdminViewModel(singletonCImpl.categoryRepositoryImplProvider.get());

          case 4: // com.shopapp.presentation.viewmodel.DashboardViewModel 
          return (T) new DashboardViewModel(singletonCImpl.productRepositoryImplProvider.get(), singletonCImpl.categoryRepositoryImplProvider.get(), singletonCImpl.orderRepositoryImplProvider.get(), singletonCImpl.userRepositoryImplProvider.get());

          case 5: // com.shopapp.presentation.viewmodel.ForgotPasswordViewModel 
          return (T) new ForgotPasswordViewModel(singletonCImpl.authRepositoryImplProvider.get());

          case 6: // com.shopapp.presentation.viewmodel.OrderDetailViewModel 
          return (T) new OrderDetailViewModel(singletonCImpl.orderRepositoryImplProvider.get());

          case 7: // com.shopapp.presentation.viewmodel.OrdersAdminViewModel 
          return (T) new OrdersAdminViewModel(singletonCImpl.orderRepositoryImplProvider.get());

          case 8: // com.shopapp.presentation.viewmodel.OrdersViewModel 
          return (T) new OrdersViewModel(singletonCImpl.orderRepositoryImplProvider.get());

          case 9: // com.shopapp.presentation.ui.uipublic.product.ProductDetailViewModel 
          return (T) new ProductDetailViewModel(singletonCImpl.productRepositoryImplProvider.get());

          case 10: // com.shopapp.presentation.viewmodel.ProductImageViewModel 
          return (T) new ProductImageViewModel(singletonCImpl.productRepositoryImplProvider.get());

          case 11: // com.shopapp.presentation.viewmodel.ProductsAdminViewModel 
          return (T) new ProductsAdminViewModel(singletonCImpl.productRepositoryImplProvider.get(), singletonCImpl.categoryRepositoryImplProvider.get());

          case 12: // com.shopapp.presentation.viewmodel.ProfileViewModel 
          return (T) new ProfileViewModel(singletonCImpl.userRepositoryImplProvider.get());

          case 13: // com.shopapp.presentation.viewmodel.ResetPasswordConfirmViewModel 
          return (T) new ResetPasswordConfirmViewModel(singletonCImpl.authRepositoryImplProvider.get());

          case 14: // com.shopapp.presentation.viewmodel.SendNotificationViewModel 
          return (T) new SendNotificationViewModel(singletonCImpl.userRepositoryImplProvider.get());

          case 15: // com.shopapp.presentation.viewmodel.UsersAdminViewModel 
          return (T) new UsersAdminViewModel(singletonCImpl.userRepositoryImplProvider.get());

          default: throw new AssertionError(id);
        }
      }
    }
  }

  private static final class ActivityRetainedCImpl extends ShopApplication_HiltComponents.ActivityRetainedC {
    private final SingletonCImpl singletonCImpl;

    private final ActivityRetainedCImpl activityRetainedCImpl = this;

    private Provider<ActivityRetainedLifecycle> provideActivityRetainedLifecycleProvider;

    private ActivityRetainedCImpl(SingletonCImpl singletonCImpl,
        SavedStateHandleHolder savedStateHandleHolderParam) {
      this.singletonCImpl = singletonCImpl;

      initialize(savedStateHandleHolderParam);

    }

    @SuppressWarnings("unchecked")
    private void initialize(final SavedStateHandleHolder savedStateHandleHolderParam) {
      this.provideActivityRetainedLifecycleProvider = DoubleCheck.provider(new SwitchingProvider<ActivityRetainedLifecycle>(singletonCImpl, activityRetainedCImpl, 0));
    }

    @Override
    public ActivityComponentBuilder activityComponentBuilder() {
      return new ActivityCBuilder(singletonCImpl, activityRetainedCImpl);
    }

    @Override
    public ActivityRetainedLifecycle getActivityRetainedLifecycle() {
      return provideActivityRetainedLifecycleProvider.get();
    }

    private static final class SwitchingProvider<T> implements Provider<T> {
      private final SingletonCImpl singletonCImpl;

      private final ActivityRetainedCImpl activityRetainedCImpl;

      private final int id;

      SwitchingProvider(SingletonCImpl singletonCImpl, ActivityRetainedCImpl activityRetainedCImpl,
          int id) {
        this.singletonCImpl = singletonCImpl;
        this.activityRetainedCImpl = activityRetainedCImpl;
        this.id = id;
      }

      @SuppressWarnings("unchecked")
      @Override
      public T get() {
        switch (id) {
          case 0: // dagger.hilt.android.ActivityRetainedLifecycle 
          return (T) ActivityRetainedComponentManager_LifecycleModule_ProvideActivityRetainedLifecycleFactory.provideActivityRetainedLifecycle();

          default: throw new AssertionError(id);
        }
      }
    }
  }

  private static final class ServiceCImpl extends ShopApplication_HiltComponents.ServiceC {
    private final SingletonCImpl singletonCImpl;

    private final ServiceCImpl serviceCImpl = this;

    private ServiceCImpl(SingletonCImpl singletonCImpl, Service serviceParam) {
      this.singletonCImpl = singletonCImpl;


    }
  }

  private static final class SingletonCImpl extends ShopApplication_HiltComponents.SingletonC {
    private final ApplicationContextModule applicationContextModule;

    private final SingletonCImpl singletonCImpl = this;

    private Provider<TokenDataStore> tokenDataStoreProvider;

    private Provider<AuthInterceptor> authInterceptorProvider;

    private Provider<HttpLoggingInterceptor> provideLoggingInterceptorProvider;

    private Provider<OkHttpClient> provideOkHttpClientProvider;

    private Provider<Retrofit> provideRetrofitProvider;

    private Provider<AuthApi> provideAuthApiProvider;

    private Provider<AuthRepositoryImpl> authRepositoryImplProvider;

    private Provider<OrderApi> provideOrderApiProvider;

    private Provider<OrderRepositoryImpl> orderRepositoryImplProvider;

    private Provider<ProductApi> provideProductApiProvider;

    private Provider<ProductRepositoryImpl> productRepositoryImplProvider;

    private Provider<CategoryApi> provideCategoryApiProvider;

    private Provider<CategoryRepositoryImpl> categoryRepositoryImplProvider;

    private Provider<UserApi> provideUserApiProvider;

    private Provider<UserRepositoryImpl> userRepositoryImplProvider;

    private SingletonCImpl(ApplicationContextModule applicationContextModuleParam) {
      this.applicationContextModule = applicationContextModuleParam;
      initialize(applicationContextModuleParam);

    }

    @SuppressWarnings("unchecked")
    private void initialize(final ApplicationContextModule applicationContextModuleParam) {
      this.tokenDataStoreProvider = DoubleCheck.provider(new SwitchingProvider<TokenDataStore>(singletonCImpl, 4));
      this.authInterceptorProvider = DoubleCheck.provider(new SwitchingProvider<AuthInterceptor>(singletonCImpl, 5));
      this.provideLoggingInterceptorProvider = DoubleCheck.provider(new SwitchingProvider<HttpLoggingInterceptor>(singletonCImpl, 6));
      this.provideOkHttpClientProvider = DoubleCheck.provider(new SwitchingProvider<OkHttpClient>(singletonCImpl, 3));
      this.provideRetrofitProvider = DoubleCheck.provider(new SwitchingProvider<Retrofit>(singletonCImpl, 2));
      this.provideAuthApiProvider = DoubleCheck.provider(new SwitchingProvider<AuthApi>(singletonCImpl, 1));
      this.authRepositoryImplProvider = DoubleCheck.provider(new SwitchingProvider<AuthRepositoryImpl>(singletonCImpl, 0));
      this.provideOrderApiProvider = DoubleCheck.provider(new SwitchingProvider<OrderApi>(singletonCImpl, 8));
      this.orderRepositoryImplProvider = DoubleCheck.provider(new SwitchingProvider<OrderRepositoryImpl>(singletonCImpl, 7));
      this.provideProductApiProvider = DoubleCheck.provider(new SwitchingProvider<ProductApi>(singletonCImpl, 10));
      this.productRepositoryImplProvider = DoubleCheck.provider(new SwitchingProvider<ProductRepositoryImpl>(singletonCImpl, 9));
      this.provideCategoryApiProvider = DoubleCheck.provider(new SwitchingProvider<CategoryApi>(singletonCImpl, 12));
      this.categoryRepositoryImplProvider = DoubleCheck.provider(new SwitchingProvider<CategoryRepositoryImpl>(singletonCImpl, 11));
      this.provideUserApiProvider = DoubleCheck.provider(new SwitchingProvider<UserApi>(singletonCImpl, 14));
      this.userRepositoryImplProvider = DoubleCheck.provider(new SwitchingProvider<UserRepositoryImpl>(singletonCImpl, 13));
    }

    @Override
    public void injectShopApplication(ShopApplication shopApplication) {
    }

    @Override
    public Set<Boolean> getDisableFragmentGetContextFix() {
      return Collections.<Boolean>emptySet();
    }

    @Override
    public ActivityRetainedComponentBuilder retainedComponentBuilder() {
      return new ActivityRetainedCBuilder(singletonCImpl);
    }

    @Override
    public ServiceComponentBuilder serviceComponentBuilder() {
      return new ServiceCBuilder(singletonCImpl);
    }

    private static final class SwitchingProvider<T> implements Provider<T> {
      private final SingletonCImpl singletonCImpl;

      private final int id;

      SwitchingProvider(SingletonCImpl singletonCImpl, int id) {
        this.singletonCImpl = singletonCImpl;
        this.id = id;
      }

      @SuppressWarnings("unchecked")
      @Override
      public T get() {
        switch (id) {
          case 0: // com.shopapp.data.repository.AuthRepositoryImpl 
          return (T) new AuthRepositoryImpl(singletonCImpl.provideAuthApiProvider.get(), singletonCImpl.tokenDataStoreProvider.get());

          case 1: // com.shopapp.data.remote.api.AuthApi 
          return (T) NetworkModule_ProvideAuthApiFactory.provideAuthApi(singletonCImpl.provideRetrofitProvider.get());

          case 2: // retrofit2.Retrofit 
          return (T) NetworkModule_ProvideRetrofitFactory.provideRetrofit(singletonCImpl.provideOkHttpClientProvider.get());

          case 3: // okhttp3.OkHttpClient 
          return (T) NetworkModule_ProvideOkHttpClientFactory.provideOkHttpClient(singletonCImpl.tokenDataStoreProvider.get(), singletonCImpl.authInterceptorProvider.get(), singletonCImpl.provideLoggingInterceptorProvider.get());

          case 4: // com.shopapp.data.local.TokenDataStore 
          return (T) new TokenDataStore(ApplicationContextModule_ProvideContextFactory.provideContext(singletonCImpl.applicationContextModule));

          case 5: // com.shopapp.data.remote.interceptor.AuthInterceptor 
          return (T) new AuthInterceptor(singletonCImpl.tokenDataStoreProvider.get());

          case 6: // okhttp3.logging.HttpLoggingInterceptor 
          return (T) NetworkModule_ProvideLoggingInterceptorFactory.provideLoggingInterceptor();

          case 7: // com.shopapp.data.repository.OrderRepositoryImpl 
          return (T) new OrderRepositoryImpl(singletonCImpl.provideOrderApiProvider.get());

          case 8: // com.shopapp.data.remote.api.OrderApi 
          return (T) NetworkModule_ProvideOrderApiFactory.provideOrderApi(singletonCImpl.provideRetrofitProvider.get());

          case 9: // com.shopapp.data.repository.ProductRepositoryImpl 
          return (T) new ProductRepositoryImpl(singletonCImpl.provideProductApiProvider.get(), ApplicationContextModule_ProvideContextFactory.provideContext(singletonCImpl.applicationContextModule));

          case 10: // com.shopapp.data.remote.api.ProductApi 
          return (T) NetworkModule_ProvideProductApiFactory.provideProductApi(singletonCImpl.provideRetrofitProvider.get());

          case 11: // com.shopapp.data.repository.CategoryRepositoryImpl 
          return (T) new CategoryRepositoryImpl(singletonCImpl.provideCategoryApiProvider.get());

          case 12: // com.shopapp.data.remote.api.CategoryApi 
          return (T) NetworkModule_ProvideCategoryApiFactory.provideCategoryApi(singletonCImpl.provideRetrofitProvider.get());

          case 13: // com.shopapp.data.repository.UserRepositoryImpl 
          return (T) new UserRepositoryImpl(singletonCImpl.provideUserApiProvider.get(), ApplicationContextModule_ProvideContextFactory.provideContext(singletonCImpl.applicationContextModule));

          case 14: // com.shopapp.data.remote.api.UserApi 
          return (T) NetworkModule_ProvideUserApiFactory.provideUserApi(singletonCImpl.provideRetrofitProvider.get());

          default: throw new AssertionError(id);
        }
      }
    }
  }
}
