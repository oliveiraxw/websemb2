<g:applyLayout name="main">
    <head>
        <title>Error</title>
    </head>

    <body>
    <g:if env="development">
        <g:if test="${Throwable.isInstance(exception)}">
            <g:renderException exception="${exception}"/>
        </g:if>
        <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
            <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}"/>
        </g:elseif>
        <g:else>
            <ul class="errors">
                <li>An error has occurred</li>
                <li>Exception: ${exception}</li>
                <li>Message: ${message}</li>
                <li>Path: ${path}</li>
            </ul>
        </g:else>
    </g:if>
    <g:else>
        <asset:image src="500.png" class="center-block"/>
    </g:else>
    </body>
</g:applyLayout>