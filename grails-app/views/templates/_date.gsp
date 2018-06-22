<div class="form-group form-group-${name} col-md-${width}${offset ? ' ' + offset : ''}${cssClass ? ' ' + cssClass : ''}${hidden == 'true' ? ' d-none' : ''}">
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
            <span class="red">*</span>
        </g:if>
    </label>
    <div class="form-group">
        <input type="date" name="${name}" value="${value ? value.format('yyyy-MM-dd') : ''}" class="form-control${height ? ' ' + height : ''}" id="${name}" placeholder="dd/mm/aaaa" ${required != false ? 'required="required"' : ''} />
    </div>
    <small id="${name}HelpBlock" class="form-text text-muted">
        <g:if test="${helpText}">
            ${helpText}
        </g:if>
    </small>
</div>
