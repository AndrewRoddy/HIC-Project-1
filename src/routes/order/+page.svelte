<script lang="ts">
  import Bagel from '../../lib/components/Bagel.svelte';
  let name = 'Svelte!!!';
  let bagel =
    'src/lib/assets/bagels/Cinnamon-Raisin-Bagel.webp';
</script>

<h1 class="center">Buy a bagel!</h1>

<div class="bagel-bin">
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
  <Bagel
    img="Garlic-Bagel.webp"
    name="Garlic"
    price="9.50"
  />
  <Bagel
    img="Honey-Wholewheat-Bagel.webp"
    name="Honey Wholewheat"
    price="9.50"
  />
  <Bagel img="Onion-Bagel.webp" name="Onion" price="9.50" />
  <Bagel img="Plain-Bagel.webp" name="Plain" price="9.50" />
  <Bagel
    img="Poppyseed-Bagel.webp"
    name="Poppyseed"
    price="9.50"
  />
  <Bagel
    img="Pumpernickel-Bagel.webp"
    name="Pumpernickel"
    price="9.50"
  />
  <Bagel
    img="Sesame-Seed-Bagel.webp"
    name="Sesame Seed"
    price="9.50"
  />
</div>

<style>
  p {
    color: goldenrod;
  }

  .bagel-bin {
    text-align: center;
    justify-content: center;
  }

  .center {
    text-align: center;
  }
</style>
