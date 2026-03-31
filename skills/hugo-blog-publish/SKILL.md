---
name: hugo-blog-publish
description: Use this skill when the user wants to write or update a post for this Hugo blog, preview the result, and finish with git add, commit, and push. Covers drafting Markdown in content/posts, checking Hugo build output, and publishing changes to origin/main.
---

# Hugo Blog Publish

Use this skill for this repository when the task is to create or update a blog post and carry the change through publication.

## Scope

- Write or revise a post under `content/posts/`
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
5. If the homepage or list page must reflect the new post, verify the relevant layout still renders the post list correctly.
6. Run `hugo` from the repository root.
7. If the build fails, fix the issue before proceeding.
8. Review `git status --short` and stage only the files related to the task.
9. Commit with a short message that matches the actual change.
10. Push with `git push origin main`.

## Writing Guidance

- Match the tone already used in `content/posts/`.
- For a first or introductory post, explain what the blog will cover and how it will be used.
- Use Markdown features that Hugo handles cleanly: headings, lists, code fences, and inline code.
- Avoid placeholders such as "TBD" in published posts unless the user explicitly wants them.

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
