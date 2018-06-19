<div class="col-xs-${width} ${offset}">
    <dl>
        <dt><g:message code="${domain}.${name}.label" /></dt>
        <dd class="sliding-middle-out">
            <g:if test="${pre}"><pre>${raw(value)}</pre></g:if>
            <g:else>${raw(value)}</g:else>
        </dd>
    </dl>
</div>
