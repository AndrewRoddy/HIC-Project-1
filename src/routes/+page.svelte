<script lang="ts">
  let name = 'test';
  let count = $state(0);

  // Ups the count!
  function increment() {
    count += 1;
  }
</script>

<h1>Welcome to our page!</h1>
<p>
  Visit {name.toUpperCase()}
  <a href="https://svelte.dev/docs/kit"
    >svelte.dev/docs/kit</a
  >
  to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
  <br />to read the documentation
</p>

<button onclick={increment}>
  Click to up the count!!
</button>

{count}
Test

<style>
  p {
    color: goldenrod;
  }
</style>
