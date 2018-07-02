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

There is a tag to display a field for `show.gsp` views and another one to render form fields.

To show a field you can use:

`<bf:showField bean="${user}" property="username" />`

To render a form field you can use:

`<bf:formField bean="${user}" property="username" />`
