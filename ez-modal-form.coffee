EZFormModal = (args, callback) ->
  if (!args.template)
    throw Error('Template undefined')
  
  modalData = 
    bodyTemplate: args.template
    dataContext: args.data
    title: args.title
    fixedFooter: true
    leftButtons: [
      html: 'Cancel'
    ]
    rightButtons: [
      html: 'Submit'
      fn: (e, tmpl) ->
        # trigger HTML5 validation
        $(tmpl.find('input[type="submit"]')).click()
    ]

  # spawn the modal
  $thisModal = EZModal(modalData)
  # initialize materialize shizzle.
  $('textarea', $thisModal).trigger('autoresize')
  # wire up HTML5 validation by injecting 'submit' element
  $thisModalForm = $('.modal-content form', $thisModal)
  $thisModalForm.append('<input type="submit" class="hide"/>')
  # override submit event and callback if valid
  $thisModalForm.on 'submit', (e) ->
    e.preventDefault()
    # by now we are valid
    callback(null, $thisModalForm.serializeJSON())

  return $thisModal
