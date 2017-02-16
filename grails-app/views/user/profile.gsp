<g:applyLayout name="material">
    <title>Profile</title>
    <content tag="container">
        <div id="profile-page" class="section">
            <div id="profile-page-header" class="card">
                <div class="card-image waves-effect waves-block waves-light">
                    <asset:image src="user-profile-bg.jpg"/>
                </div>
                <figure class="card-profile-image">
                    <g:if test="${first}">
                        <img src="${resource(dir: "images/${first.user.username}", file: "${first.name}")}"
                             alt="profile image" class="circle z-depth-2 responsive-img">
                    </g:if>
                    <g:else>
                        <asset:image src="profile.png"
                                     alt="profile image" class="circle z-depth-2 responsive-img"/>
                    </g:else>
                </figure>

                <div class="card-content">
                    <div class="row">
                        <div class="col s3 offset-s2">
                            <h4 class="card-title grey-text text-darken-4"><sec:username/></h4>

                            <p class="medium-small grey-text"><sec:loggedInUserInfo field="authorities"/></p>
                        </div>

                        <div class="col s6 right-align">
                            <g:link controller="user" action="editProfile"
                                    class="btn-floating btn-large waves-effect waves-light darken-2 right">
                                <i class="mdi-image-edit"></i>
                            </g:link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <g:if test="${photos}">
            <div class="slider center-block">
                <ul class="slides">
                    <g:each var="photo" in="${photos}">
                        <li>
                            <img src="${resource(dir: "images/${photo.user.username}", file: "${photo.name}")}"/>
                        </li>
                    </g:each>
                </ul>
            </div>
        </g:if>
    </content>
</g:applyLayout>