<div class="form-group form-group-${name} col-md-${width}${cssClass ? ' ' + cssClass : ''}${hidden == 'true' ? ' d-none' : ''}">
    <label for="${name}">
        <g:if test="${message(code: domain + '.' + name + '.abbr', default: '') != ''}">
            <abbr title="${message(code: domain + '.' + name + '.label')}">
                <g:message code="${domain + '.' + name + '.abbr'}" />
            </abbr>
        </g:if>
        <g:else>
            <g:message code="${domain + '.' + name + '.label'}" />
        </g:else>
        <g:if test="${required != false}">
            <span class="text-danger">*</span>
        </g:if>
    </label>
    <g:if test="${addon != null}">
        <div class="input-group">
    </g:if>
    <input type="text" name="${name}" value="${value}" class="form-control${attrs.height ? ' ' + attrs.height : ''}" id="${name}" placeholder="${message(code: domain + '.' + name + '.label')}" ${required ? 'required=required' : ''} ${maxlength ? 'maxlength=' + maxlength : ''} />
    <g:if test="${addon != null}">
        <div class="input-group-append">
            <div class="input-group-text">
                ${addon}
            </div>
        </div>
        </div>
    </g:if>
    <small id="${name}HelpBlock" class="form-text text-muted">
        <g:if test="${helpText}">
            ${helpText}
        </g:if>
    </small>
</div>
