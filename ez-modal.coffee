EZModal = (options, callback) ->

  # turn string to body text
  optionType = typeof options
  if ['number', 'string'].indexOf(optionType) > -1
    options = {body: options}

  bootstrapOptions =
    keyboard: options.keyboard
    show: options.show
    backdrop: options.backdrop

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
    # TODO Add button generation

  instance = Blaze.renderWithData Template.EZModal, templateOptions, document.body

  modal = $(instance.firstNode()).modal bootstrapOptions

  # clean up after remove
  modal.on 'hidden.bs.modal', (e) ->
    callback(e) if callback?
    Blaze.remove instance

  # return the modal object itself
  return modal