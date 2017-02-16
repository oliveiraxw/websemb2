<%@ page import="grails.web.Action" %>
<g:applyLayout name="material">
    <title>Routes</title>
    <content tag="container">
        <table class="centered striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Default Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="controller" in="${controllers}">
                <tr>
                    <td>${controller.fullName}</td>
                    <td>${controller.defaultAction}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:pagination total="${count}"/>
    </content>
</g:applyLayout>