import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

export default defineConfig({
  integrations: [
    starlight({
      title: 'Resistance Node Docs',
      description: 'A documentation node for resistance operatives.',
      sidebar: [{ label: 'Introduction', link: '/' }]
    })
  ]
});