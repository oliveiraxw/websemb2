<g:applyLayout name="material">
    <title>Photos</title>
    <content tag="container">
        <table class="centered striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Image</th>
                <th width="100px"><g:applyLayout template="/templates/upload"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each var="photo" in="${photos}">
                <tr>
                    <td>${photo.name}</td>
                    <td><img src="${resource(dir: "images/${photo.user.username}", file: "${photo.name}")}"
                             class="materialboxed materialboxedCustom"/></td>
                    <td width="70px">
                        <g:form controller="photo" action="delete" method="delete"
                                params="[id: photo.id, redirectAction: actionName]">
                            <button type="submit" class="btn-floating waves-effect waves-light red"><i
                                    class="mdi-action-delete prefix"></i></button>
                        </g:form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:pagination total="${count}" params="[id: id]"/>
    </content>
</g:applyLayout>