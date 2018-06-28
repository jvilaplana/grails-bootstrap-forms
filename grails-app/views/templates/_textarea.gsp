<div class="form-group form-group-${name} col-md-${width}${cssClass ? ' ' + cssClass : ''}${hidden == 'true' ? ' d-none' : ''}">
    <label for="${name}">
        <g:if test="${message(code: domain + '.' + name + '.abbr', default: '') != ''}">
            <abbr title="${message(code: domain + '.' + name + '.label', default: message(code: domainCapitalized + '.' + name + '.label'))}">
                <g:message code="${domain + '.' + name + '.abbr'}" default="${message(code: domainCapitalized + '.' + name + '.abbr')}" />
            </abbr>
        </g:if>
        <g:else>
            <g:message code="${domain + '.' + name + '.label'}" default="${message(code: domainCapitalized + '.' + name + '.label')}" />
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
    <g:if test="${required == 'required'}">
        <g:textArea name="${name}" value="${value}" class="form-control${height ? ' ' + height : ''}" placeholder="${g.message(code: domain + '.' + name + '.label')}" rows="${rows}" maxlength="${maxlength}" required="required" />
    </g:if>
    <g:else>
        <g:textArea name="${name}" value="${value}" class="form-control${height ? ' ' + height : ''}" placeholder="${g.message(code: domain + '.' + name + '.label')}" rows="${rows}" maxlength="${maxlength}"  />
    </g:else>
    <small id="${name}HelpBlock" class="form-text text-muted">
        <g:if test="${helpText}">
            ${helpText}
        </g:if>
    </small>
</div>
