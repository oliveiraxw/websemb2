<g:applyLayout name="material">
    <title>Users</title>

    <content tag="container">
        <table class="centered striped">
            <thead>
            <tr>
                <th>Username</th>
                <th>Photos</th>
                <th>Last Access</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="user" in="${users}">
                <tr>
                    <td>${user.username}</td>
                    <td>
                        <g:link controller="photo" action="show" params="[id: user.id]"
                                class="btn-floating waves-effect waves-light blue"><i
                                class="mdi-image-remove-red-eye"></i></g:link>
                    </td>
                    <td><g:form controller="user" action="lastAccess" method="put" params="[id: user.id]">
                        <div class="row">
                            <g:formatDate date="${user.lastAccess}" type="datetime" style="medium"/>
                            <button class="btn-floating waves-effect waves-light">
                                <i class="mdi-action-autorenew"></i>
                            </button>
                        </div>
                    </g:form></td>
                    <td width="70px">
                        <g:link controller="user" action="edit" params="[id: user.id]">
                            <button type="submit" class="btn-floating waves-effect waves-light green"><i
                                    class="mdi-image-edit"></i></button>
                        </g:link>
                    </td>
                    <td width="70px">
                        <g:form controller="user" action="delete" method="delete" params="[id: user.id]">
                            <button type="submit" class="btn-floating waves-effect waves-light red"><i
                                    class="mdi-action-delete"></i></button>
                        </g:form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:pagination total="${count}"/>
    </content>
</g:applyLayout>