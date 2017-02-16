<sec:ifLoggedIn>
    <ul class="right hide-on-med-and-down">
        <li>
            <a class="dropdown-button waves-effect waves-light" href="#"
               data-activates="profile-dropdown"><asset:image src="profile.png"
                                                              class="circle image-profile"/><sec:username/><i
                    class="mdi-navigation-arrow-drop-down right"></i></a>
        </li>
    </ul>
    <ul id="profile-dropdown" class="dropdown-content">
        <li><g:link controller="user" action="profile"><i
                class="mdi-action-face-unlock left"></i> Profile</g:link>
        </li>                    <li class="divider"></li>
        <li><g:link controller="logoff"><i class="mdi-hardware-keyboard-tab left"></i> Logout</g:link>
        </li>
    </ul>
</sec:ifLoggedIn>