Package.describe({
  summary: "Easy Bootstrap 3 Modals",
  version: "0.3.2",
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
    'ez-modal-bootstrap.html',
    'ez-modal-bootstrap.coffee',
    'ez-modal-materialize.html',
    'ez-modal-materialize.coffee',
    'ez-modal.coffee'
  ], 'client');

  api.export('EZModal')
});