package com.jordiv.bootstrapForms

import grails.core.GrailsApplication
import grails.core.support.GrailsApplicationAware


class BootstrapFormsTagLib implements GrailsApplicationAware {
    GrailsApplication grailsApplication

    static namespace = "bf"
    static defaultEncodeAs = [taglib: 'raw']
    static encodeAsForTags = [tagName: [taglib: 'html'], otherTagName: [taglib: 'none']]

    def showField = { attrs, body ->
        def property = attrs.property
        attrs.domainCapitalized = attrs.bean.getClass().getSimpleName()
        attrs.domain = attrs.domainCapitalized.uncapitalize()
        if (!attrs.value) attrs.value = attrs.bean[attrs.property] != null ? attrs.bean[attrs.property] : '<i class="fas fa-minus" style="color: red;"></i>'

        attrs.offset = attrs.offset ? 'col-md-offset-' + attrs.offset : ''
        attrs.pre = attrs.pre ?: false
        if (attrs.width == null) attrs.width = 3

        attrs.show = true

        if (!attrs.type) attrs = propertyClassToType(attrs)

        if (attrs.prefix && attrs.bean[attrs.property] != null) attrs.value = g.message(code: attrs.prefix + '.' + attrs.value)
        out << g.render(template: "/templates/showField",
                model: [width: attrs.width, offset: attrs.offset, domainCapitalized: attrs.domainCapitalized, domain: attrs.domain, property: property,
                        cssClass: attrs.cssClass, value: attrs.value, addon: attrs.addon, type: attrs.type,
                        offset: attrs.offset, rawValue: attrs.rawValue, link: attrs.link])
    }

    /**
     * Renders a form field from a domain class.
     *
     * @attr bean REQUIRED the domain class name
     * @attr property REQUIRED the property name of the domain class
     * @attr type the property type: 'text' (default), 'textarea', 'number', 'select', 'date', 'switch'
     *
     * //TODO: Add documentation
     */
    def formField = { attrs, body ->
        attrs.required = attrs.required ?: false
        attrs.prefix = attrs.prefix ?: null
        attrs.domainCapitalized = attrs.bean.getClass().getSimpleName()
        attrs.domain = attrs.domainCapitalized.uncapitalize()

        attrs.name = attrs.property

        attrs.value = attrs.value ?: attrs.bean[attrs.property]
        if (attrs.width == null) attrs.width = 3

        attrs.height = attrs.height ?: grailsApplication?.config?.get('bootstrapForms.defaultHeight')

        if(!attrs.height) attrs.height = ''
        else if(attrs.height == 'sm') attrs.height = 'form-control-sm'
        else if(attrs.height == 'lg') attrs.height = 'form-control-lg'

        if (!attrs.type) {
            attrs = propertyClassToType(attrs)
        }

        if (attrs.type == 'select') {
            if (attrs.value == null) attrs.value = ''
        } else {
            if (attrs.value != 0) attrs.value = attrs.value ?: ''
        }

        attrs.required = attrs.required ?: false
        attrs.offset = attrs.offset ? 'col-md-offset-' + attrs.offset : ''
        attrs.addon = attrs.addon ?: null
        attrs.rows = attrs.rows ?: 2
        attrs.cssClass = attrs.cssClass ?: ''
        attrs.tooltip = attrs.tooltip ?: null
        attrs.step = attrs.step ?: 'any'

        def type = attrs.type ?: 'text'

        if (type == 'text') {
            out << g.render(template: "/templates/text", model: attrs)
        }
        if (type == 'textarea') {
            out << g.render(template: "/templates/textarea", model: attrs)
        } else if (type == 'number') {
            out << g.render(template: "/templates/number", model: attrs)
        } else if (type == 'select') {
            out << g.render(template: "/templates/select", model: attrs)
        } else if (type == 'date') {
            out << g.render(template: "/templates/date", model: attrs)
        } else if (type == 'time') {
            out << g.render(template: "/templates/time", model: attrs)
        } else if (type == 'transient') {
            out << g.render(template: "/templates/transient", model: attrs)
        }
    }

    private def propertyClassToType(attrs) {

        if (attrs.property in attrs.bean.getClass().transients) {
            attrs.type = 'transient'
            return attrs
        }

        /*
        def enumList = grailsApplication?.config?.get('bootstrapForms.enumList')
        def enumClassesList = []
        if(enumList) {
                enumList.each { e ->
                    enumClassesList.add(Class.forName(e))
            }
        }
        */

        def beanClassType = attrs.bean.getClass().getDeclaredField(attrs.property)?.type
        /*
        if(enumClassesList?.contains(beanClassType)) {
            attrs.type = 'select'
            attrs.from = beanClassType.values()
            attrs.noSelection = ['': message(code: 'default.noSelection')]
            def tmp = beanClassType.toString().split('\\.')[-1]
            attrs.prefix = 'enum.' + tmp.uncapitalize() + '.value'
            return attrs
        }*/

        if(beanClassType.isEnum()) {
            attrs.type = 'select'
            attrs.from = beanClassType.values()
            attrs.noSelection = ['': message(code: 'default.noSelection')]
            def tmp = beanClassType.toString().split('\\.')[-1]
            attrs.prefix = attrs.prefix ?: 'enum.' + tmp.uncapitalize() + '.value'
            return attrs
        }

        if(grailsApplication.getArtefacts("Domain")*.clazz.contains(beanClassType)) {
            attrs.type = attrs.type ?: 'select'
            attrs.from = attrs.from ?: beanClassType.list()
            attrs.optionKey = attrs.optionKey ?: 'id'
            if(attrs.show) attrs.value = attrs.value ?: attrs.value?.id?.toString()
            else attrs.value = attrs.value?.id?.toString() ?: attrs.value
            attrs.noSelection = attrs.noSelection ?: ['': message(code: 'default.noSelection')]

            return attrs
        }

        switch (attrs.bean.getClass().getDeclaredField(attrs.property)?.type) {
            case (java.lang.String):
                attrs.type = 'text'
                break
            case (java.lang.Integer):
                attrs.type = 'number'
                break
            case (java.lang.Float):
                attrs.type = 'number'
                break
            case (java.util.Date):
                if (attrs.property in ['dateCreated', 'lastUpdated']) attrs.type = 'datetime'
                else attrs.type = 'date'
                break
            case (java.lang.Boolean):
                attrs.type = 'select'
                if (attrs.prefix == null) attrs.prefix = 'default.yesno'
                attrs.from = [true, false]
                attrs.noSelection = ['': message(code: 'default.noSelection')]
                break
            default:
                attrs.type = 'text'
        }
        return attrs
    }
}
