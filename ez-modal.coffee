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
    # styling
    classes: options.classes
    fade: options.fade?= true
    # simple content
    title: options.title
    body: options.body
    # templates
    dataContext: options.dataContext?= {}
    headerTemplate: options.headerTemplate
    bodyTemplate: options.bodyTemplate
    footerTemplate: options.footerTemplate
    # buttons
    buttons: options.leftButtons || options.rightButtons
    leftButtons: options.leftButtons
    rightButtons: options.rightButtons

  instance = Blaze.renderWithData Template.EZModal, templateOptions, document.body

  modal = $(instance.firstNode()).modal bootstrapOptions

  templateOptions.dataContext.EZModal = modal

  # clean up after remove
  modal.on 'hidden.bs.modal', (e) ->
    callback(e) if callback?
    Blaze.remove instance

  # return the modal object itself
  return modal

Template.EZModal.events
  'click .ez-modal-button' : (e,tmpl) ->
    if @fn
      do @fn.bind tmpl.data.dataContext, e, tmpl
    else
      tmpl.data.dataContext.EZModal.modal('hide')
