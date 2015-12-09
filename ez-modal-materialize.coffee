Template.EZModal_materialize.events
  'click .ez-modal-button' : (e,tmpl) ->
    if @fn
      do @fn.bind tmpl.data.dataContext, e, tmpl
    else
      tmpl.data.dataContext.EZModal.closeModal()

share.materializeModal = (options, callback) ->

  materializeOptions =
    complete: ->
      callback() if callback?
      Blaze.remove instance

  materializeOptions.dismissible = options.dismissible if options.dismissible?
  materializeOptions.opacity = options.opacity if options.opacity?
  materializeOptions.in_duration = options.in_duration if options.in_duration?
  materializeOptions.out_duration = options.out_duration if options.out_duration?
  materializeOptions.ready = options.ready if options.ready?

  templateOptions =
    # styling
    classes: options.classes
    # type
    fixedFooter: options.fixedFooter
    bottomSheet: options.bottomSheet
    # simple content
    title: options.title
    body: options.body
    bodyHtml: options.bodyHtml
    # templates
    dataContext: options.dataContext?= {}
    template: options.template
    bodyTemplate: options.bodyTemplate
    footerTemplate: options.footerTemplate
    # buttons
    leftButtons: options.leftButtons
    rightButtons: options.rightButtons
    _showButtons : options.leftButtons || options.rightButtons

  instance = Blaze.renderWithData Template.EZModal_materialize, templateOptions, document.body

  modal = $(instance.firstNode()).openModal materializeOptions

  templateOptions.dataContext.EZModal = modal

  # return the modal object itself
  return modal
