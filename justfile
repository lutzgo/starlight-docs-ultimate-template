# Justfile — command runner for dev tasks

# Run the dev server
dev:
  cd docs && pnpm dev

# Install dependencies
install:
  cd docs && pnpm install

# Build the Starlight docs
build:
  cd docs && pnpm build

# Format code
fmt:
  pnpm prettier --write .

# Lint Markdown and check formatting
lint:
  pnpm prettier --check .
  pnpm dlx markdownlint-cli2 '**/*.md'

# Setup Git hooks
setup:
  pnpm dlx lefthook install

# Clean build output
clean:
  rm -rf docs/dist

# Offline build + test
test:
  pnpm prettier --check .
  pnpm dlx markdownlint-cli2 '**/*.md'
  cd docs && pnpm build