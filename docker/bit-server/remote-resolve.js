const fs = require('fs');
const path = require('path');

const SCOPE = process.env.SCOPE;
const SCOPE_REMOTES = process.env.SCOPE_REMOTES;

function resolve() {
  if (!SCOPE_REMOTES) {
    return;
  }

  const config = JSON.parse(fs.readFileSync(path.resolve(`/root/${SCOPE}/scope.json`), { encoding: 'utf8' }));
  config.remotes = {};

  SCOPE_REMOTES.split(',').map((it) => {
    const keyVal = it.split('@');
    config.remotes[keyVal[0]] = keyVal[1];
  });

  fs.writeFileSync(path.resolve(`/root/${SCOPE}/scope.json`), JSON.stringify(config, null, 2), { encoding: 'utf8' });
}

resolve();
