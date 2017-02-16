<%@ page import="grails.web.Action" %>
<g:applyLayout name="material">
    <title>Routes</title>
    <content tag="container">
        <table class="centered striped">
            <thead>
            <tr>
                <th>URI</th>
                <th>HTTP Method</th>
                <th>Grails Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="route" in="${routes}">
                <tr>
                    <g:each var="argType" in="${route.argTypes}">
                        <g:set var="args" value="${"\${" + argType + "}"}"/>
                    </g:each>
                    <g:if test="${args != null}">
                        <td>${(route.controller ? route.controller.name : "") + "/" + route.action + "/" + args}</td>
                    </g:if>
                    <g:else>
                        <td>${(route.controller ? route.controller.name : "") + "/" + route.action}</td>
                    </g:else>
                    <td>${route.httpMethod}</td>
                    <td>${route.action}</td>
                    <g:set var="args" value="${null}"/>
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:pagination total="${count}"/>
    </content>
</g:applyLayout>