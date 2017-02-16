<g:if test="${flash.message}">
    <div class="row">
        <div class="col s12 offset-s3">
            <div id="card-alert" class="card red lighten-5 col s6">
                <div class="card-content red-text">
                    <p>${flash.message}</p>
                </div>
                <button type="button" class="close red-text" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
        </div>
    </div>
</g:if>