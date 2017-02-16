<g:applyLayout name="material">
    <title>Login</title>
    <content tag="container">
        <div class="card-panel">
            <asset:image src="profile.png" class="image"/>
            <g:applyLayout template="/templates/messageError"/>
            <g:form controller="login" action="authenticate">
                <div class="row">
                    <div class="input-field col s4 offset-s4">
                        <i class="mdi-action-account-circle prefix"></i>
                        <input type="text" id="username" name="username" class="validate" required autofocus>
                        <label for="username">Username</label>
                    </div>

                    <div class="row">
                        <div class="input-field col s4 offset-s4">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input type="password" id="password" name="password" class="validate" required>
                            <label for="password">Password</label>
                        </div>
                    </div>
                </div>

                <div class="row center-align">
                    <button class="btn" type="submit">
                        <i class="mdi-content-send right"></i>Sign in
                    </button>
                </div>
            </g:form>
        </div>
    </content>
</g:applyLayout>
