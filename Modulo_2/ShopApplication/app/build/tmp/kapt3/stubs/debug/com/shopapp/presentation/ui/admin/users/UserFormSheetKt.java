package com.shopapp.presentation.ui.admin.users;

@kotlin.Metadata(mv = {1, 9, 0}, k = 2, xi = 48, d1 = {"\u0000>\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001aF\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00010\b2\u0006\u0010\t\u001a\u00020\u00062\b\b\u0002\u0010\n\u001a\u00020\u000bH\u0003\u001a<\u0010\f\u001a\u00020\u00012\b\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0012\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00010\b2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00010\u0014H\u0007\u00a8\u0006\u0015"}, d2 = {"ToggleCard", "", "label", "", "description", "checked", "", "onChanged", "Lkotlin/Function1;", "enabled", "modifier", "Landroidx/compose/ui/Modifier;", "UserFormSheet", "initial", "Lcom/shopapp/domain/model/User;", "formState", "Lcom/shopapp/presentation/viewmodel/UserFormState;", "onSave", "Lcom/shopapp/domain/model/UserPayload;", "onDismiss", "Lkotlin/Function0;", "app_debug"})
public final class UserFormSheetKt {
    
    @kotlin.OptIn(markerClass = {androidx.compose.material3.ExperimentalMaterial3Api.class})
    @androidx.compose.runtime.Composable()
    public static final void UserFormSheet(@org.jetbrains.annotations.Nullable()
    com.shopapp.domain.model.User initial, @org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.UserFormState formState, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function1<? super com.shopapp.domain.model.UserPayload, kotlin.Unit> onSave, @org.jetbrains.annotations.NotNull()
    kotlin.jvm.functions.Function0<kotlin.Unit> onDismiss) {
    }
    
    @androidx.compose.runtime.Composable()
    private static final void ToggleCard(java.lang.String label, java.lang.String description, boolean checked, kotlin.jvm.functions.Function1<? super java.lang.Boolean, kotlin.Unit> onChanged, boolean enabled, androidx.compose.ui.Modifier modifier) {
    }
}