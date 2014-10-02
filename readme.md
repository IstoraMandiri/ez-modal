# EZ Modal

### Easy Bootstrap 3 Modals for Meteor

```
$ meteor add hitchcott:ez-modal
```

This package adds an `EZModal` method to the client. When called, it appends a bootstrap 3 modal to the client with various options.

It uses `Blaze.renderWithData` to provide a clean reactive appendature to the DOM, and it removes itself when the modal is closed.

It supports dynanmic templates for header, body and footer.

## Examples

```coffeescript
# Most simple usage
EZModal 'Hello World'

# Some more paramters
EZModal
  title: 'Sorry!'
  body: 'You are not authorized to do that'
  classes: 'purple'
  fade: false
  backdrop: false

# Specify custom templates by passing the template key
# Pass data with optional dataContext
EZModal
  dataContext: someData
  headerTemplate: 'myHeaderTempalte'
  bodyTemplate: 'myBodyTemplate'
  footerTemplate: 'myFooterTemplate'

# Pass a second parameter for callback on close
EZModal 'Thank you', -> console.log 'modal closed'

# Do other stuff with the modal
myModal = EZModal
  show: false
  body: 'Testing'

myModal.modal('show')
```

## API

```coffeescript

bootstrapOptions =
  keyboard: options.keyboard
  backdrop: options.backdrop
  show: options.show

templateOptions =
  classes: options.classes
  fade: options.fade?= true
  dataContext: options.dataContext
  title: options.title
  body: options.body
  button: options.button
  headerTemplate: options.headerTemplate
  bodyTemplate: options.bodyTemplate
  footerTemplate: options.footerTemplate
```

## Credits

[Chris Hitchcott](http://github.com/hitchcott), Oct 2014

MIT License 2014