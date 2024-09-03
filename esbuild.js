const esbuild = require('esbuild');

esbuild.build({
  entryPoints: ['app/javascript/packs/application.js'],
  bundle: true,
  outdir: 'public/packs',
  sourcemap: true,
  target: ['es2015']
}).catch(() => process.exit(1));