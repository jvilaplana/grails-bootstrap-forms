<div class="form-group form-group-${property} col-md-${width}${offset ? ' ' + offset : ''}${cssClass ? ' ' + cssClass : ''}${hidden == 'true' ? ' d-none' : ''}">
    <label for="${name}">
        <g:if test="${message(code: domain + '.' + property + '.abbr', default: '') != ''}">
            <abbr title="${message(code: domain + '.' + property + '.label', default: message(code: domainCapitalized + '.' + property + '.label'))}">
                <g:message code="${domain + '.' + property + '.abbr'}" default="${message(code: domainCapitalized + '.' + property + '.abbr')}" />
            </abbr>
        </g:if>
        <g:else>
            <g:message code="${domain + '.' + property + '.label'}" default="${message(code: domainCapitalized + '.' + property + '.label')}" />
        </g:else>
        <g:if test="${required != false}">
            <span class="text-danger">*</span>
        </g:if>
        <%--
        <i class="fa fa-tags" aria-hidden="true"></i>
        --%>
    </label>
    <g:if test="${addon != null}">
        <div class="input-group">
    </g:if>
    <%-- applyCode prevents double quotes to be rendered as &quot; inside the groovy code (this part: 'min="') --%>
    <%-- Another workaround is to use it as the "max" attribute --%>
    <%-- More here: http://aruizca.com/how-to-render-json-properly-without-escaping-quotes-inside-a-gsp-script-tag/ --%>
    <g:applyCodec encodeAs="none">
    <input type="number" step="${step}" ${min ? 'min="' + min + '"' : ''} max="${max ? max : ''}" name="${name}" value="${value}" ${required ? 'required="required"' : ''} class="form-control${height ? ' ' + height : ''}" id="${name}" placeholder="${message(code: domain + '.' + property + '.placeholder', default: message(code: domain + '.' + property + '.label'))}" />
    </g:applyCodec>
    <g:if test="${addon != null}">
        <div class="input-group-append">
            <div class="input-group-text">
                ${raw(addon)}
            </div>
        </div>
        </div>
    </g:if>
    <small id="${property}HelpBlock" class="form-text text-muted">
        <g:if test="${helpText}">
            ${helpText}
        </g:if>
    </small>
</div>
