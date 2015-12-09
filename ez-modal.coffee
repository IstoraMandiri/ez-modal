EZModal = (options, callback) ->
  # turn string to body text
  optionType = typeof options
  if ['number', 'string'].indexOf(optionType) > -1
    options = {body: options}

  # check which framework to use and pass the params
  if Package['twbs:bootstrap']
    share.bootstrapModal options, callback
  else if Package['materialize:materialize']
    share.materializeModal options, callback