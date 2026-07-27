package com.shopapp.presentation.ui.admin;

@kotlin.Metadata(mv = {1, 9, 0}, k = 2, xi = 48, d1 = {"\u00008\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001aJ\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\n2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00060\f2\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00060\u000e2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00060\u000eH\u0003\u001ak\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\n2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00060\f2\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00060\u000e2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00060\u000e2\u0006\u0010\u0011\u001a\u00020\b2\u0017\u0010\u0012\u001a\u0013\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00060\f\u00a2\u0006\u0002\b\u0014H\u0007\"\u0017\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0003\u0010\u0004\u00a8\u0006\u0015"}, d2 = {"ADMIN_NAV_ITEMS", "", "Lcom/shopapp/presentation/ui/admin/AdminNavItem;", "getADMIN_NAV_ITEMS", "()Ljava/util/List;", "AdminDrawerContent", "", "currentRoute", "", "user", "Lcom/shopapp/domain/model/LoggedUser;", "onNavClick", "Lkotlin/Function1;", "onStoreClick", "Lkotlin/Function0;", "onLogout", "AdminScaffold", "title", "content", "Landroidx/compose/foundation/layout/PaddingValues;", "Landroidx/compose/runtime/Composable;", "app_debug"})
public final class AdminScaffoldKt {
    @org.jetbrains.annotations.NotNull()
    private static final java.util.List<com.shopapp.presentation.ui.admin.AdminNavItem> ADMIN_NAV_ITEMS = null;
    
    @org.jetbrains.annotations.NotNull()
    public static final java.util.List<com.shopapp.presentation.ui.admin.AdminNavItem> getADMIN_NAV_ITEMS() {
        return null;
    }
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    public static final void AdminScaffold(@org.jetbrains.annotations.NotNull()
    java.lang.String currentRoute, @org.jetbrains.annotations.Nullable()
    com.shopapp.domain.model.LoggedUser user, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super java.lang.String, kotlin.Unit> onNavClick, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onStoreClick, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onLogout, @org.jetbrains.annotations.NotNull()
    java.lang.String title, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super androidx.compose.foundation.layout.PaddingValues, kotlin.Unit> content) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void AdminDrawerContent(java.lang.String currentRoute, com.shopapp.domain.model.LoggedUser user, kotlin.jvm.functions.Function1<? super java.lang.String, kotlin.Unit> onNavClick, kotlin.jvm.functions.Function0<kotlin.Unit> onStoreClick, kotlin.jvm.functions.Function0<kotlin.Unit> onLogout) {
    }
}