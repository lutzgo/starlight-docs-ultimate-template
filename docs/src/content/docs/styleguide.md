---
title: Styleguide
description: Structure for docs in the resistance node.
sidebar:
  hidden: false
---

# ✍ Styleguide for Resistance Docs

Each document should begin with a valid frontmatter block.

## Example Frontmatter:

```yaml
---
title: Operation Cipherstorm
description: Decryption procedure for secure uplinks.
sidebar:
  label: "Cipherstorm"
  order: 2
---
```

## Recommended Structure
- Use headers `#`, `##`, `###` to organize content
- Use `<Callout>`, `<SystemLog>`, `<EncryptedNote>` for immersive storytelling
- Add meaningful `title` and `description` to improve search

⚠ Without `sidebar.hidden: false`, some documents may crash the nav renderer in newer Starlight versions.