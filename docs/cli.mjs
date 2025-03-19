#!/usr/bin/env node

import fs from 'fs';
import path from 'path';

const args = process.argv.slice(2);
if (!args.length || args.includes('help')) {
  console.log('Usage: node cli.mjs <docname>');
  process.exit(0);
}

const doc = args[0].replace(/\.md$/, '') + '.md';
const docPath = path.resolve('./docs', doc);

if (!fs.existsSync(docPath)) {
  console.error(`❌ Doc '${doc}' not found in ./docs/`);
  process.exit(1);
}

const content = fs.readFileSync(docPath, 'utf-8');
console.log('────────────────────────────────────────────────────');
console.log(`# ${doc.replace('.md', '')}`);
console.log('────────────────────────────────────────────────────');
console.log(content);