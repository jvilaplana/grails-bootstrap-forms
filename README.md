# Grails Bootstrap Forms
A Grails 3 plugin to automatically generate form fields using Bootstrap 4.


## Overview
The grails-bootstrap-forms plugin offers an easy-to-use TagLib to render fields in views.


## Basic usage
Add the Bintray repository to your `build.gradle` file:

```
buildscript {
    repositories {
        ...
        maven { url "http://dl.bintray.com/jvilaplana/plugins" }
    }
}
```

Add the dependency to your project's `build.gradle` file:

```
dependencies {
    ...
    compile 'grails.bootstrap.forms:grails-bootstrap-forms:0.2.9'
}
```

Add the stylesheet to your project's `application.css` file:

```
*= require bootstrap-forms
```

There is a tag to display a field for `show.gsp` views and another one to render form fields.

To show a field you can use:

`<bf:showField bean="${user}" property="username" />`

To render a form field you can use:

`<bf:formField bean="${user}" property="username" />`


### Documentation

#### showField attributes

| Attribute | Description |
| --------- | ----------- |
| `bean` | Instance |
| `property` | Property of the `bean` to be rendered |
| `width` | [Column width](http://getbootstrap.com/docs/4.1/layout/grid/), defaults to `3` |
| `type` | Type of the property to be rendered. One of `text`, `textarea`, `number`, `date`, `time`, `datetime` or `select`. If not specified, the type will be guessed.
| `addon` | If specified, its value will be appended to the field. |
| `cssClass` | A CSS class that will be added to the field |


#### formField attributes

| Attribute | Description |
| --------- | ----------- |
| `bean` | Instance |
| `property` | Property of the `bean` to be rendered |
| `width` | [Column width](http://getbootstrap.com/docs/4.1/layout/grid/), defaults to `3` |
| `type` | Type of the property to be rendered. One of `text`, `textarea`, `number`, `date`, `time`, `transient` or `select`. If not specified, the type will be guessed.
| `addon` | If specified, its value will be appended to the field. |
| `cssClass` | A CSS class that will be added to the field |
| `required` | Set its value to `required` to set the field as required. |
| `height` | Set the [sizing of the field](http://getbootstrap.com/docs/4.1/components/forms/#sizing) to `lg` or `sm`.
| `rows` | Set the number of rows for fields with `type="textarea"`.
| `name` | Set the `name` and `id` attributes of the field. Defaults to `property`. |


[ ![Download](https://api.bintray.com/packages/jvilaplana/plugins/grails-bootstrap-forms/images/download.svg) ](https://bintray.com/jvilaplana/plugins/grails-bootstrap-forms/_latestVersion)
