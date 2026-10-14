<script lang="ts">
  import Bagel from '../../lib/components/Bagel.svelte';
</script>

<h1 class="page-header">Buy a Bagel</h1>

<div class="bagel-bin">
  <Bagel
    id={1}
    img="Ancient-Grain-Bagel.webp"
    name="Ancient Grain"
    price={9.5}
  />
  <Bagel
    id={2}
    img="Cinnamon-Raisin-Bagel.webp"
    name="Cinnamon Raisin"
    price={9.5}
  />
  <Bagel
    id={3}
    img="Cranberry-Bagel.webp"
    name="Cranberry"
    price={9.5}
  />
  <Bagel
    id={4}
    img="Everything-Bagel.webp"
    name="Everything"
    price={9.5}
  />
  <Bagel
    id={5}
    img="Garlic-Bagel.webp"
    name="Garlic"
    price={9.5}
  />
  <Bagel
    id={6}
    img="Honey-Wholewheat-Bagel.webp"
    name="Honey Wholewheat"
    price={9.5}
  />
  <Bagel 
    id={7}
    img="Onion-Bagel.webp" 
    name="Onion" 
    price={9.5} 
  />
  <Bagel 
    id={8}
    img="Plain-Bagel.webp" 
    name="Plain" 
    price={9.5} 
  />
  <Bagel
    id={9}
    img="Poppyseed-Bagel.webp"
    name="Poppyseed"
    price={9.5}
  />
  <Bagel
    id={10}
    img="Pumpernickel-Bagel.webp"
    name="Pumpernickel"
    price={9.5}
  />
  <Bagel
    id={11}
    img="Sesame-Seed-Bagel.webp"
    name="Sesame Seed"
    price={9.5}
  />
</div>

<style>
  .bagel-bin {
    list-style: none;
    margin: 0;
    padding: 1em;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 40px;
  }

  .page-header {
    text-align: left;
    padding-left: 0.75em;
    color: var(--text);
  }

  h1 {
    color: var(--text);
  }
</style>
