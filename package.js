Package.describe({
  summary: "Easy Framework-Agnostic Modals",
  version: "0.4.0",
  name: 'hitchcott:ez-modal',
  git: "https://github.com/hitchcott/ez-modal"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.3.1');

  api.use([
    'jquery',
    'templating',
    'coffeescript'
  ], 'client');

  api.addFiles([
    'frameworks/ez-modal-bootstrap.html',
    'frameworks/ez-modal-bootstrap.coffee',
    'frameworks/ez-modal-materialize.html',
    'frameworks/ez-modal-materialize.coffee',
    'ez-modal.coffee',
    'ez-modal-form.coffee'
  ], 'client');

  api.export(['EZModal', 'EZFormModal'], 'client')
});