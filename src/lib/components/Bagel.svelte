<script lang="ts">
    // Passed in properties for the bagel
    let { 
        img = "Cinnamon-Raisin-Bagel.webp",
        name = "Regular Bagel",
        price = 99.99 
    }  = $props();

    // Builds the bagel path
    let bagel_path = "src/lib/assets/bagels/";
    let full_bagel_path = bagel_path + img;
</script>

<div>
    <img src={full_bagel_path} />
    <div>
        <h1>{name}</h1> 
        <h3>${price}</h3>
    </div>
</div>
