<div class="col-md-${width} ${offset}">
    <dl class="animated fadeIn">
        <dt>
            <g:if test="${message(code: domain + '.' + property + '.abbr', default: '') != ''}">
                <abbr title="${message(code: domain + '.' + property + '.label', default: message(code: domainCapitalized + '.' + property + '.label'))}">
                    <g:message code="${domain + '.' + property + '.abbr'}" />
                </abbr>
            </g:if>
            <g:else>
                <g:message code="${domain}.${property}.label" default="${message(code: domainCapitalized + '.' + property + '.label')}" />
            </g:else>
        </dt>
        <dd id="${'show-' + domain + '-' + property}" class="sliding-middle-out${cssClass ? ' ' + cssClass : ''}">
            <g:if test="${pre}"><pre>${raw(value)}</pre></g:if>
            <g:else>
                <g:if test="${type == 'text'}">${raw(value)}<g:if test="${addon != null}"> ${raw(addon)}</g:if></g:if>
                <g:elseif test="${type == 'textarea'}">${raw(value.replace('\n', '<br />'))}<g:if test="${addon != null}"> ${raw(addon)}</g:if></g:elseif>
                <g:elseif test="${type == 'number'}">
                    <g:if test="${rawValue != null && rawValue instanceof Number}">
                        <g:formatNumber number="${rawValue}" maxFractionDigits="2" />
                    </g:if>
                    <g:else>
                        ${raw(value)}
                    </g:else>
                    <g:if test="${addon != null}">
                        ${raw(addon)}
                    </g:if>
                </g:elseif>
                <g:elseif test="${type == 'date'}">
                    <g:if test="${value instanceof Date}">
                        <g:formatDate date="${value}" format="dd/MM/yyyy" />
                    </g:if>
                    <g:else>${raw(value)}</g:else>
                </g:elseif>
                <g:elseif test="${type == 'time'}">
                    <g:if test="${value instanceof Date}">
                        <g:formatDate date="${value}" format="HH:mm" />
                    </g:if>
                    <g:else>${raw(value)}</g:else>
                </g:elseif>
                <g:elseif test="${type == 'datetime'}">
                    <g:if test="${value instanceof Date}">
                        <g:formatDate date="${value}" format="dd/MM/yyyy HH:mm" />
                    </g:if>
                    <g:else>${raw(value)}</g:else>
                </g:elseif>
                <g:elseif test="${type == 'select'}">
                    <g:if test="${prefix}">
                        <g:if test="${rawValue != null}">
                            <g:message code="${prefix}.${rawValue}" default="${'<i class="fas fa-minus" style="color: red;"></i>'}" />
                        </g:if>
                        <g:else>
                            ${raw(value)}
                        </g:else>
                    </g:if>
                    <g:else>
                        <g:if test="${link}">
                            <g:link controller="${link}" action="show" id="${value.id}">
                                ${raw(value)}
                            </g:link>
                        </g:if>
                        <g:else>
                            ${raw(value)}
                        </g:else>
                    </g:else>
                </g:elseif>
                <g:else>
                    ${raw(value)}
                    <g:if test="${addon != null}">
                        ${raw(addon)}
                    </g:if>
                </g:else>
            </g:else>
        </dd>
    </dl>
</div>
