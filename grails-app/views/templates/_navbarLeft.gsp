<aside id="left-sidebar-nav">
    <ul id="slide-out" class="side-nav fixed leftside-navigation">
        <li class="user-details cyan darken-2">
        </li>
        <li class="bold"><g:link controller="welcome" action="index" class="waves-effect waves-cyan"><i
                class="mdi-action-home"></i> Welcome</g:link>
        </li>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i
                            class="mdi-social-people"></i>Users</a>

                        <div class="collapsible-body">
                            <ul>
                                <li><g:link controller="user" action="create">Add User</g:link>
                                </li>
                                <li><g:link controller="user" action="all">All Users</g:link>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i
                            class="mdi-image-camera-alt"></i>Photos</a>

                        <div class="collapsible-body">
                            <ul>
                                <li><g:link controller="photo" action="view">My Photos</g:link>
                                </li>
                                <li><g:link controller="photo" action="all">All Photos</g:link>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>

            <li class="no-padding">
                <ul class="collapsible collapsible-accordion">
                    <li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i
                            class="mdi-action-settings"></i>Settings</a>
                        <div class="collapsible-body">
                            <ul>
                                <li><g:link controller="route" action="controllers">Controllers</g:link>
                                </li>
                                <li><g:link controller="route" action="all">Routes</g:link>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </li>
            <li><g:link controller="dbconsole"><i
                    class="mdi-action-payment"></i>Database</g:link>
            </li>
        </sec:ifAllGranted>
        <sec:ifNotGranted roles="ROLE_ADMIN">
            <li><g:link controller="user" action="profile"><i
                    class="mdi-image-camera-alt"></i>My Photos</g:link>
            </li>
        </sec:ifNotGranted>
    </ul>
    <a href="#" data-activates="slide-out"
       class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i
            class="mdi-navigation-menu"></i></a>
</aside>
