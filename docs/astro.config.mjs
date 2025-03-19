import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  integrations: [
    starlight({
      title: 'Resistance Node Docs',
      description: 'A documentation node for resistance operatives.',
      social: {
        twitter: 'https://twitter.com/resistance_docs',
        github: 'https://github.com/yourusername/starlight-docs-template'
      }
    })
  ]
});