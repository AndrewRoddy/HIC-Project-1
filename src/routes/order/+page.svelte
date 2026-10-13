<script lang="ts">
  import Bagel from '../../lib/components/Bagel.svelte';
  // let name = 'Svelte!!!';
  // let bagel =
  //   'src/lib/assets/bagels/Cinnamon-Raisin-Bagel.webp';
</script>

<h1 class="center">Buy a bagel!</h1>

<div class="bagel-bin">
  <Bagel
    img="Ancient-Grain-Bagel.webp"
    name="Ancient Grain"
    price={9.5}
  />
  <Bagel
    img="Cinnamon-Raisin-Bagel.webp"
    name="Cinnamon Raisin"
    price={9.5}
  />
  <Bagel
    img="Cranberry-Bagel.webp"
    name="Cranberry"
    price={9.5}
  />
  <Bagel
    img="Everything-Bagel.webp"
    name="Everything"
    price={9.5}
  />
  <Bagel
    img="Garlic-Bagel.webp"
    name="Garlic"
    price={9.5}
  />
  <Bagel
    img="Honey-Wholewheat-Bagel.webp"
    name="Honey Wholewheat"
    price={9.5}
  />
  <Bagel 
    img="Onion-Bagel.webp" 
    name="Onion" 
    price={9.5} 
  />
  <Bagel 
    img="Plain-Bagel.webp" 
    name="Plain" 
    price={9.5} 
  />
  <Bagel
    img="Poppyseed-Bagel.webp"
    name="Poppyseed"
    price={9.5}
  />
  <Bagel
    img="Pumpernickel-Bagel.webp"
    name="Pumpernickel"
    price={9.5}
  />
  <Bagel
    img="Sesame-Seed-Bagel.webp"
    name="Sesame Seed"
    price={9.5}
  />
</div>

<style>
  .bagel-bin {
    text-align: center;
    justify-content: center;
  }

  .center {
    text-align: center;
  }

  h1 {
    color: var(--text);
  }
</style>
