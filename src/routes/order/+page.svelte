<script lang="ts">
  import Bagel from '../../lib/components/Bagel.svelte';
  let name = 'Svelte!!!';
  let bagel =
    'src/lib/assets/bagels/Cinnamon-Raisin-Bagel.webp';
</script>

<h1>
  About our app using {name}
</h1>

<Bagel
  img="Ancient-Grain-Bagel.webp"
  name="Ancient Grain"
  price="9.50"
/>
<Bagel
  img="Cinnamon-Raisin-Bagel.webp"
  name="Cinnamon Raisin"
  price="9.50"
/>
<Bagel
  img="Cranberry-Bagel.webp"
  name="Cranberry"
  price="9.50"
/>
<Bagel
  img="Everything-Bagel.webp"
  name="Everything"
  price="9.50"
/>
<Bagel img="Garlic-Bagel.webp" name="Garlic" price="9.50" />
<Bagel
  img="Honey-Wholewheat-Bagel.webp"
  name="Honey Wholewheat"
  price="9.50"
/>
<Bagel img="Onion-Bagel.webp" name="Bagel" price="9.50" />
<Bagel img="Plain-Bagel.webp" name="Bagel" price="9.50" />
<Bagel
  img="Poppyseed-Bagel.webp"
  name="Bagel"
  price="9.50"
/>
<Bagel
  img="Pumpernickel-Bagel.webp"
  name="Bagel"
  price="9.50"
/>
<Bagel
  img="Sesame-Seed-Bagel.webp"
  name="Bagel"
  price="9.50"
/>

<p>
  Visit {name.toUpperCase()}
  <a href="https://svelte.dev/docs/kit"
    >svelte.dev/docs/kit</a
  >
  to read the documentation
</p>
Test

<style>
  p {
    color: goldenrod;
  }
</style>
