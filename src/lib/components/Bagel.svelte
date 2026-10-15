<script lang="ts">
  import { resolve } from '$app/paths';
  // Passed in properties for the bagel
  let {
    id,
    img = 'Cinnamon-Raisin-Bagel.webp',
    name = 'Regular Bagel',
    price = 99.99,
    cal = 280
  } = $props();

  // Builds the bagel path
  const full_bagel_path = $derived('/bagels/' + img);
</script>

<a
  href="{resolve('/bagel')}?id={id}&path={full_bagel_path}&name={name}&price={price}&cal={cal}"
>
  <button class="container">
    <img src={full_bagel_path} class="bagel-image" alt="{name}"/>
    <div class="text-area">
      <h1>{name}</h1>
      <div>
        <h1>Bagel</h1>
        <h2>${price.toFixed(2)}</h2>
      </div>
    </div></button
  >
</a>

<style>
  .container {
    /* Spae in bewteen the squares */
    margin: 0.3em;

    /* Centers bagel */
    text-align: center;

    /* Removes the button border */
    border: 0;

    /* Makes the div resize to the size of the text/bagel */
    display: inline-block;

    background-color: var(--surface);
    border: 0.5px solid var(--border);

    padding: 1em;
    border-radius: 1em;
  }

  .container:hover {
    background-color: var(--surface-hover);
    .bagel-image {
      transform: scale(1.1);
    }
  }

  .bagel-image {
    width: 15em;
    height: 15em;
    transition: all 0.1s ease;
  }

  .text-area {
    color: white;
    gap: 1em;
    text-align: center;
  }

  h1 {
    margin: 0;
    padding: 0;
    color: var(--text);
    font-family: 'Times New Roman';
  }

  h2 {
    margin: 0;
    padding: 0;
    color: var(--text-muted);
    font-family: 'Times New Roman';
  }
</style>
