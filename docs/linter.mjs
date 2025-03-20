#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import matter from 'gray-matter';

const docsPath = path.resolve('./docs/src/content/docs');
const files = fs.readdirSync(docsPath).filter(f => f.endsWith('.md'));

let hasErrors = false;

files.forEach(file => {
  const fullPath = path.join(docsPath, file);
  const content = fs.readFileSync(fullPath, 'utf-8');
  const { data } = matter(content);

  const required = ['title', 'description', 'sidebar'];
  const optionalSidebar = ['hidden', 'label', 'order'];

  console.log(`📂 Checking: ${file}`);

  for (const key of required) {
    if (!data[key]) {
      console.warn(`❌ Missing required frontmatter field: ${key}`);
      hasErrors = true;
    }
  }

  if (typeof data.sidebar !== 'object') {
    console.warn(`❌ 'sidebar' must be an object`);
    hasErrors = true;
  } else {
    for (const key of optionalSidebar) {
      if (!(key in data.sidebar)) {
        console.log(`⚠ Optional sidebar field '${key}' not defined in ${file}`);
      }
    }
  }

  if (data.head && !Array.isArray(data.head)) {
    console.warn(`❌ 'head' must be an array of tag/attrs objects`);
    hasErrors = true;
  }
});

if (hasErrors) {
  console.log("\n💥 Validation failed. Please fix the issues above.");
  process.exit(1);
} else {
  console.log("✅ All frontmatter passed validation.");
}