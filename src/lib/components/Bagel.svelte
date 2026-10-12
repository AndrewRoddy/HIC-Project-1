<script lang="ts">
  // Passed in properties for the bagel
  let {
    img = 'Cinnamon-Raisin-Bagel.webp',
    name = 'Regular Bagel',
    price = 99.99
  } = $props();

  // Builds the bagel path
  let bagel_path = 'src/lib/assets/bagels/';
  let full_bagel_path = bagel_path + img;
</script>

<div class="container">
  <img src={full_bagel_path} />
  <div class="text-area">
    <h1>{name}</h1>
    <h1>Bagel</h1>
    <h3>${price}</h3>
  </div>
</div>

<style>
  .container {
    /* Spae in bewteen the squares */
    margin: 0.3em;

    /* Centers bagel */
    text-align: center;

    /* Makes the div resize to the size of the text/bagel */
    display: inline-block;

    background-color: #ff922f;
    padding: 1em;
    border-radius: 1em;

    /* Sets the image size */
    img {
      width: 15em;
      height: 15em;
    }
  }

  .text-area {
    color: white;
    gap: 1em;
    text-align: center;

    h1,
    h3 {
      margin: 0;
      padding: 0;
    }
  }
</style>
