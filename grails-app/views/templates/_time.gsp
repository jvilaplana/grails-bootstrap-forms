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
            <span class="red">*</span>
        </g:if>
    </label>
    <div class="input-group">
        <input type="text" name="${name}" value="${value ? value.format('HH:mm') : ''}" class="form-control${height ? ' ' + height : ''} timepicker" id="${name}" placeholder="HH:MM" ${required != false ? 'required="required"' : ''} />
    </div>
    <small id="${property}HelpBlock" class="form-text text-muted">
        <g:if test="${helpText}">
            ${helpText}
        </g:if>
    </small>
</div>
