<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description"
          content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
    <meta name="keywords"
          content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
    <title><g:layoutTitle default="materialize"/></title>

    <asset:stylesheet href="materialize.min.css" media="screen,projection"/>
    <asset:stylesheet href="style.css" media="screen,projection"/>
    <asset:stylesheet href="custom.css" media="screen,projection"/>

    <asset:javascript src="jquery-1.11.2.min.js"/>
    <asset:javascript src="materialize.min.js"/>
    <asset:javascript src="perfect-scrollbar.min.js"/>
    <asset:javascript src="plugins.min.js"/>

    <g:layoutHead/>
</head>

<body>
<g:applyLayout template="/templates/load"/>

<g:applyLayout template="/templates/navbarTop"/>

<g:applyLayout template="/templates/container"/>

<g:applyLayout template="/templates/footer"/>
</body>

</html>