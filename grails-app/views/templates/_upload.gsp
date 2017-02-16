<g:if test="${actionName != "all"}">
    <g:uploadForm controller="photo" action="upload"
                  params="[id: id, redirectAction: actionName]">
        <div class="row">
            <div class="file-field input-field">
                Action
                <div class="btn-floating waves-effect waves-light blue">
                    <i class="mdi-file-cloud-upload"></i>
                    <input type="file" id="photos" name="photos" onchange="submit();"  accept="image/*" multiple>
                </div>
            </div>
        </div>
    </g:uploadForm>
</g:if>
<g:else>
    Action
</g:else>