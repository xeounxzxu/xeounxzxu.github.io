# Repository Guidelines

## Project Structure & Module Organization
This repository is a Hugo site for GitHub Pages. Site configuration lives in `hugo.toml`. Content pages are under `content/`, with blog posts in `content/posts/`. Shared HTML templates live in `layouts/`, including `layouts/_default/` for base, list, and single-page views, plus `layouts/index.html` for the home page. Static assets are served from `static/`, with site styles in `static/css/main.css`. New posts should follow the archetype in `archetypes/default.md`.

## Build, Test, and Development Commands
Use Hugo CLI commands from the repository root:

- `hugo server -D`: run the site locally and include draft posts.
- `hugo`: build the production site into `public/`.
- `hugo new content/posts/my-post.md`: create a new post from the default archetype.

Before opening a PR, run `hugo` once to catch template or front matter errors.

## Coding Style & Naming Conventions
Use 2-space indentation in HTML templates, TOML, and CSS to match the existing files. Keep Hugo templates simple and place shared structure in `layouts/_default/`. Name content files with lowercase kebab-case, for example `content/posts/my-second-post.md`. In front matter, keep keys short and consistent: `title`, `date`, `draft`, `description`, and `tags`. Prefer Markdown body content in Korean unless the page specifically requires another language.

## Testing Guidelines
There is no automated test suite configured yet. Validation is build-based: run `hugo` for every change, and use `hugo server -D` to verify navigation, metadata, and responsive layout manually. When adding a post, confirm it appears on the home page and that the generated permalink resolves correctly.

## Commit & Pull Request Guidelines
Recent commits use a simple prefix format such as `feature: first commit`. Continue using short, imperative messages with a lowercase type prefix, for example `feature: add about page` or `fix: correct post date`. Pull requests should include a brief summary, note any changed templates or content paths, and attach screenshots for visible UI changes.

## Content & Publishing Notes
Set `draft = false` only when a post is ready to publish. Keep `baseURL` aligned with the GitHub Pages domain in `hugo.toml`, and avoid committing generated output unless the deployment workflow explicitly requires `public/`.
