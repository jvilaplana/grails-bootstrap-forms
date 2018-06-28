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
    </label>
    <g:if test="${required != false && noSelection != null}">
        <g:select name="${name}" from="${from}" optionKey="${optionKey}" optionValue="${optionValue}" noSelection="${noSelection}" value="${value}" required="required" class="form-control${height ? ' ' + height : ''} ${inputClass}" valueMessagePrefix="${prefix}" />
    </g:if>
    <g:elseif test="${required != false && noSelection == null}">
        <g:select name="${name}" from="${from}" optionKey="${optionKey}" optionValue="${optionValue}" value="${value}" required="required" class="form-control${height ? ' ' + height : ''} ${inputClass}" valueMessagePrefix="${prefix}" />
    </g:elseif>
    <g:elseif test="${required == false && noSelection != null}">
        <g:select name="${name}" from="${from}" optionKey="${optionKey}" optionValue="${optionValue}" noSelection="${noSelection}" value="${value}" class="form-control${height ? ' ' + height : ''} ${inputClass}" valueMessagePrefix="${prefix}" />
    </g:elseif>
    <g:else>
        <g:select name="${name}" from="${from}" optionKey="${optionKey}" optionValue="${optionValue}" value="${value}" class="form-control${height ? ' ' + height : ''} ${inputClass}" valueMessagePrefix="${prefix}" />
    </g:else>
    <small id="${property}HelpBlock" class="form-text text-muted">
        <g:if test="${helpText}">
            ${helpText}
        </g:if>
    </small>
</div>
