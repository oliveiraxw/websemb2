<g:applyLayout name="material">
    <title>Register</title>
    <content tag="container">
        <div class="card-panel">
            <h5 class="center-align">Register</h5>
            <g:applyLayout template="/templates/messageError"/>
            <g:uploadForm controller="user" action="save">
                <div class="row">
                    <div class="input-field col s6 offset-s3">
                        <i class="mdi-action-account-circle prefix"></i>
                        <input type="text" id="username" name="username" class="validate" required autofocus>
                        <label for="username">Username</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6 offset-s3">
                        <i class="mdi-communication-vpn-key prefix"></i>
                        <input id="password" type="password" name="password" class="validate" required>
                        <label for="password">Password</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6 offset-s3">
                        <i class="mdi-communication-vpn-key prefix"></i>
                        <input id="confirmPassword" type="password" name="confirmPassword" class="validate" required>
                        <label for="confirmPassword">Confirm Password</label>
                    </div>
                </div>

                <div class="row">
                    <div class="file-field input-field col s6 offset-s3">
                        <div class="btn">
                            <span>Photos</span>
                            <input type="file" id="photos" name="photos" accept="image/*" multiple >
                        </div>

                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text"
                                   placeholder="Upload one or more files">
                        </div>
                    </div>
                </div>

                <div class="row center-align">
                    <button class="btn" type="submit">
                        <i class="mdi-content-send right"></i>Save
                    </button>
                </div>
            </g:uploadForm>
        </div>
    </content>
</g:applyLayout>