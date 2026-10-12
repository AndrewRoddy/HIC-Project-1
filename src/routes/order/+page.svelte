<script lang="ts">
    let name = "Svelte!!!";
    let bagel = "src/lib/assets/bagels/Cinnamon-Raisin-Bagel.webp";
</script>
<h1>
    About our app using {name}
</h1>
<img src = {bagel} />
<p>
    Visit  {name.toUpperCase()}
    <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a>
    to read the documentation
</p>

<style>
    p {
        color: goldenrod;
    }
</style>
Test
