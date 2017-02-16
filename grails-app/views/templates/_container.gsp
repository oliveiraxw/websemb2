<sec:ifLoggedIn>
    <main id="main">
        <div class="wrapper">
            <g:applyLayout template="/templates/navbarLeft"/>
            <section id="content">
                <div id="breadcrumbs-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col s12 m12 l12">
                                <h5 class="breadcrumbs-title">${actionName.capitalize()}</h5>
                                <ol class="breadcrumbs">
                                    <li><a>${controllerName.capitalize()}</a></li>
                                    <li class="active">${actionName.capitalize()}</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <g:pageProperty name="page.container"/>
                </div>
            </section>
        </div>
    </main>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
    <main>
        <div class="container">
            <g:pageProperty name="page.container"/>
        </div>
    </main>
</sec:ifNotLoggedIn>