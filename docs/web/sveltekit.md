# SvelteKit
* Server and client-side rendering
* Routing system
* Backend API
* Code splitting

## Project Structure
```bash
my-project/
├ src/
│ ├ lib/
│ │ └ [your lib files]
│ ├ params/
│ │ └ [your param matchers]
│ ├ routes/
│ │ └ [your routes]
│ ├ app.html
│ └ hooks.js
├ static/
│ └ [your static assets]
├ package.json
├ svelte.config.js
├ tsconfig.json
└ vite.config.js
```
**Lib**
Location to save resusable component, ex; Svelte component
**Routes**
* Url will follow routes structure
`routes/guides/first.svelte` will have `domain.com/guides/first`
* Index will be the default page on a folder
  `routes/index.svelte` will be the landing page
  `routes/guides/index.svelte` will be the default of `domain.com/guides`

### Layouts
**Layout Component**
`__layout.svelte` is called layout component, act as a skeleton/layout for any sibling(same directory as layout component) page.If layout component is at the root of the routes folder it applied to sibling and child page.

**Named layout**
Named layouts can be created at any depth, and will apply to any components in the same subtree. For example, `__layout-foo` will apply to `/x/one` and `/x/two`, but not `/x/three` or `/four`:

```bash
src/routes/
├ x/
│ ├ __layout-foo.svelte
│ ├ one@foo.svelte       # ✅ page has `@foo`
│ ├ two@foo.svelte       # ✅ page has `@foo`
│ └ three.svelte         # ❌ page does not have `@foo`
└ four@foo.svelte        # ❌ page has `@foo`, but __layout-foo is not 'in scope'
```
