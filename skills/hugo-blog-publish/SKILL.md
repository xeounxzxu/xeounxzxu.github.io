---
name: hugo-blog-publish
description: Use this skill when the user wants to write or update a post for this Hugo blog, preview the result, and finish with git add, commit, and push. Covers drafting Markdown in content/posts, checking Hugo build output, and publishing changes to origin/main.
---

# Hugo Blog Publish

Use this skill for this repository when the task is to create or update a blog post and carry the change through publication.

## Scope

- Write or revise a post under `content/posts/`
- Convert user-provided draft text into clean Hugo Markdown
- Adjust related Hugo content or metadata if needed
- Run `hugo` to verify the site builds
- Stage only the intended files
- Commit with a focused message
- Push to `origin main`

Do not edit unrelated project files unless they are required for the requested post or fix.

## Workflow

1. Inspect the current repository state with `git status --short`.
2. Read the target post if it exists. If not, create one under `content/posts/` with front matter that includes:
   - `title`
   - `date`
   - `draft: false`
   - `description`
   - `tags`
3. Write the post in Korean unless the user asks for another language.
4. Keep the post practical and publishable:
   - Start with a short opening paragraph.
   - Use section headings when the content benefits from structure.
   - Prefer concise, concrete language over filler.
5. Normalize user-provided content before saving:
   - Convert quoted front matter values into valid Hugo YAML/TOML-style front matter for this repo.
   - Replace decorative separators or emoji-only headings with normal Markdown headings when needed.
   - Convert ad-hoc examples into fenced code blocks, blockquotes, or Markdown tables.
6. Save the post under a lowercase kebab-case filename in `content/posts/`.
7. If the homepage or list page must reflect the new post, verify the relevant layout still renders the post list correctly.
8. Run `hugo` from the repository root.
9. If the build fails, fix the issue before proceeding.
10. Review `git status --short` and stage only the files related to the task.
11. Commit with a short message that matches the actual change.
12. Push with `git push origin main`.

## Concrete Flow Used For The Second Post

When the user provided the second post as raw text, the actual steps were:

1. Create `content/posts/claude-code-guide.md`
2. Rewrite the provided metadata into Hugo front matter:
   - `title`
   - full timestamp in `date`
   - `tags`
   - `draft: false`
   - `description`
3. Convert the raw body into clean Markdown:
   - summary section as a Markdown table
   - shell-like examples as fenced code blocks
   - prompt examples as blockquotes
   - bullet points preserved as lists
4. Run `hugo`
5. Stage only the new post file
6. Commit with `Add claude code guide post`
7. Push to `origin/main`

## Writing Guidance

- Match the tone already used in `content/posts/`.
- For a first or introductory post, explain what the blog will cover and how it will be used.
- Use Markdown features that Hugo handles cleanly: headings, lists, code fences, and inline code.
- Avoid placeholders such as "TBD" in published posts unless the user explicitly wants them.

## Automation

Use bundled scripts for the repetitive parts:

- `scripts/new-post.sh`: create a Hugo post skeleton with repository-standard front matter
- `scripts/publish-post.sh`: run `hugo`, stage selected files, commit, and push

Typical sequence:

1. Create the file with `scripts/new-post.sh`
2. Fill in or rewrite the Markdown body
3. Publish with `scripts/publish-post.sh`

Example:

```bash
./skills/hugo-blog-publish/scripts/new-post.sh \
  --slug claude-code-guide \
  --title "코딩 속도 2배 높이는 클로드 코드 활용 정석 가이드" \
  --date "2026-03-31T12:00:00+09:00" \
  --description "클로드 코드를 더 빠르고 안정적으로 활용하기 위한 7가지 핵심 전략을 정리한 가이드입니다." \
  --tags "claude,ai,cli,automation"
```

```bash
./skills/hugo-blog-publish/scripts/publish-post.sh \
  --file content/posts/claude-code-guide.md \
  --message "Add claude code guide post"
```

## Verification

Before pushing, confirm all of the following:

- `hugo` completes successfully
- The changed post is not left in draft mode
- No private name or identifier appears if the user asked to hide it
- `git status --short` shows only intended changes

## Commit Message Pattern

Prefer one of these patterns:

- `Add <post topic> post`
- `Update <post topic> content`
- `Fix Hugo blog content`

Use a more specific message when the change is narrowly scoped.

## Output to User

When the work is done, report:

- Which post was created or updated
- Whether `hugo` build passed
- The commit hash and whether push to `origin/main` succeeded
