Package.describe({
  summary: "Easy Bootstrap 3 Modals",
  version: "0.0.1",
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
    'ez-modal.html',
    'ez-modal.coffee'
  ], 'client');

  api.export('EZModal')
});