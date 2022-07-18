# Svelte

## Basic
1. Svelte is a **compiler** not a framework
2. Compile into a single javascript bundle
3. No extra script/libraries


## Concept

### Conditionals
If, else if, else statement
```js
let num = 10
{#if num > 100}
  <p>Greater than 100</p>
{:else if num > 10}
  <p>Greater than 10</p>
{:else}
  <p>Smaller than 10</p>
{/if}
```

### Conditional Styles
The div tag will have class `promo` if the value `isShown` is **true**
```js
let isShown = true
<div class:promo={isShown}></div>
```


### Event Forwarding
Pass event from child to parent component
```js
// Parent
const handleClick = () => {
  console.log("I am handleClick function from parent component")
}

<Modal on:click={handleClick}>
  <p>I am modal component</p>
</Modal>

// Child
// Modal.svelte
<div on:click></div>
```


### Event Modifier
Event can have a modifer. For example `once` meaning this modifier only active once.
```html
<div on:click|once={handleClick}>
  <h4>Purple Haze</h4>
</div>
```
### Loop
Loop through an array of `people`, each item represent as `person`
```js
let people = []
{#each people as person (person.id)}
  <h5>This is {person.name}</h5>
{:else}
  <h5>There is no people here</h5>
{/each}
```

### Prop
Passing down variable/object from parent to child component. 
In this case `message` variable will be pass to child component. `message` can have a default value
```js
// Parent component
// App.svelte
<Button message="Hello world!">
</Button>

// Child Component
// Button.svelte
export let message = "Hello neighbour"
<button>
  
</button>
```

#### Reactive Value
Auto update value when the child variable changed
```js
let firstName = "Jimi"
let secondName = "Hendrix"
$: fullname = `${firstName} ${secondName}`
```

#### Slot
Passing down content from parent to child component
```javascript
// Parent component
// App.svelte
<Button>
  This will be added to slot
</Button>

// Child Component
// Button.svelte
<button>
  <slot/>
</button>
```
