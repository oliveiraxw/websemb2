<g:applyLayout name="material">
    <title>Edit</title>
    <content tag="container">
        <div class="card-panel">
            <asset:image src="profile.png" class="image"/>
            <g:applyLayout template="/templates/messageError"/>
            <g:form controller="user" action="update" method="put">
                <div class="row">
                    <div class="input-field col s6 offset-s3">
                        <i class="mdi-action-account-circle prefix"></i>
                        <input type="text" id="username" name="username" class="validate" value="${user?.username}"
                               required autofocus>
                        <label for="username">Username</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6 offset-s3">
                        <i class="mdi-communication-vpn-key prefix"></i>
                        <input id="password" type="password" name="password" class="validate">
                        <label for="password">Password</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6 offset-s3">
                        <i class="mdi-communication-vpn-key prefix"></i>
                        <input id="confirmPassword" type="password" name="confirmPassword" class="validate">
                        <label for="confirmPassword">Confirm Password</label>
                    </div>
                </div>
                <input type="hidden" id="id" name="id" value="${user?.id}">

                <div class="row center-align">
                    <button class="btn" type="submit">
                        <i class="mdi-content-send right"></i>Update
                    </button>
                </div>
            </g:form>
        </div>
    </content>
</g:applyLayout>