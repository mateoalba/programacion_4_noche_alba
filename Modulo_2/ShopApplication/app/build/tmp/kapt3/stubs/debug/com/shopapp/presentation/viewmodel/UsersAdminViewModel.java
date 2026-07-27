package com.shopapp.presentation.viewmodel;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u000f\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019J\u000e\u0010\u001a\u001a\u00020\u00172\u0006\u0010\u001b\u001a\u00020\u001cJ\u0006\u0010\u001d\u001a\u00020\u0017J\u0006\u0010\u001e\u001a\u00020\u0017J\u000e\u0010\u001f\u001a\u00020\u00172\u0006\u0010 \u001a\u00020!J\u000e\u0010\"\u001a\u00020\u00172\u0006\u0010#\u001a\u00020$J\u000e\u0010%\u001a\u00020\u00172\u0006\u0010\u001b\u001a\u00020\u001cJ\u0016\u0010&\u001a\u00020\u00172\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\'\u001a\u00020(J\u0016\u0010)\u001a\u00020\u00172\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0018\u001a\u00020\u0019R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\n\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\r0\f0\u000b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0017\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00070\u000b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\t0\u000b\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u000f\u00a8\u0006*"}, d2 = {"Lcom/shopapp/presentation/viewmodel/UsersAdminViewModel;", "Landroidx/lifecycle/ViewModel;", "repository", "Lcom/shopapp/domain/repository/UserRepository;", "(Lcom/shopapp/domain/repository/UserRepository;)V", "_formState", "Lkotlinx/coroutines/flow/MutableStateFlow;", "Lcom/shopapp/presentation/viewmodel/UserFormState;", "_state", "Lcom/shopapp/presentation/viewmodel/UsersAdminUiState;", "filtered", "Lkotlinx/coroutines/flow/StateFlow;", "", "Lcom/shopapp/domain/model/User;", "getFiltered", "()Lkotlinx/coroutines/flow/StateFlow;", "formState", "getFormState", "searchJob", "Lkotlinx/coroutines/Job;", "state", "getState", "createUser", "", "payload", "Lcom/shopapp/domain/model/UserPayload;", "deleteUser", "id", "", "load", "resetFormState", "setRoleFilter", "filter", "Lcom/shopapp/presentation/viewmodel/UserRoleFilter;", "setSearch", "query", "", "toggleActive", "toggleStaff", "isStaff", "", "updateUser", "app_debug"})
@dagger.hilt.android.lifecycle.HiltViewModel()
public final class UsersAdminViewModel extends androidx.lifecycle.ViewModel {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.domain.repository.UserRepository repository = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.UsersAdminUiState> _state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.UsersAdminUiState> state = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.MutableStateFlow<com.shopapp.presentation.viewmodel.UserFormState> _formState = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.UserFormState> formState = null;
    @org.jetbrains.annotations.NotNull()
    private final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.domain.model.User>> filtered = null;
    @org.jetbrains.annotations.Nullable()
    private kotlinx.coroutines.Job searchJob;
    
    @javax.inject.Inject()
    public UsersAdminViewModel(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.repository.UserRepository repository) {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.UsersAdminUiState> getState() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<com.shopapp.presentation.viewmodel.UserFormState> getFormState() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final kotlinx.coroutines.flow.StateFlow<java.util.List<com.shopapp.domain.model.User>> getFiltered() {
        return null;
    }
    
    public final void load() {
    }
    
    public final void setSearch(@org.jetbrains.annotations.NotNull()
    java.lang.String query) {
    }
    
    public final void setRoleFilter(@org.jetbrains.annotations.NotNull()
    com.shopapp.presentation.viewmodel.UserRoleFilter filter) {
    }
    
    public final void toggleStaff(int id, boolean isStaff) {
    }
    
    public final void toggleActive(int id) {
    }
    
    public final void createUser(@org.jetbrains.annotations.NotNull()
    com.shopapp.domain.model.UserPayload payload) {
    }
    
    public final void updateUser(int id, @org.jetbrains.annotations.NotNull()
    com.shopapp.domain.model.UserPayload payload) {
    }
    
    public final void deleteUser(int id) {
    }
    
    public final void resetFormState() {
    }
}