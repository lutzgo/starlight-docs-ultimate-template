import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  integrations: [
    starlight({
      title: 'Resistance Node Docs',
      description: 'A documentation node for resistance operatives.',
      social: {
        twitter: 'resistance_docs',
        github: 'yourusername/starlight-docs-template'
      }
    })
  ]
});