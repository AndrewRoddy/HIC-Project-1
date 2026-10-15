<script lang="ts">
  import '../../app.css';
  let name = ' ';
  
  // input sanitation
  function cleanName() {
    name = name.replace(/[^\p{L}\s'-]/gu, '');
  }

  // bagels tier list
  const tiers = [
    { bagels: 2, free: 1, layout: 'stack', flavor: 'Plain' },
    { bagels: 4, free: 2, layout: 'stack', flavor: 'Garlic' },
    { bagels: 8, free: 3, layout: 'stack', flavor: 'Cranberry' },
    { bagels: 16, free: 4, layout: 'stack', flavor: 'Everything' },
    { bagels: 32, free: 5, layout: 'stack', flavor: 'Honey-Wholewheat' }
  ]
</script>

<div class="motto">
  <h1>Eat bagels. Earn rewards. Get free dough.</h1>
</div>

<div class="sign-up"> 
  <h2>SIGN UP</h2>
  <label for="name">Enter your preferred name</label>
  <form>
    <input 
    id="name" 
    type="text" 
    maxlength="35"
    placeholder="John Smith" 
    oninput={cleanName}
    bind:value={name}
    /> 
  </form>
  <button type="submit">Submit</button> 
</div>


<div class="rewards">
  <h2>REWARDS</h2>
  
  <div class="tiers">
    {#each tiers as tier}
      <div class="tier">
        <div class="pic {tier.layout}">
          {#each { length: tier.free } as _}
            <img src="/bagels/{tier.flavor}-Bagel.webp" alt="{tier.flavor} bagel" />
          {/each}
        </div>
        <p class="buy">Buy {tier.bagels}</p>
        <p class="free">
        Get {tier.free} free
        </p>
      </div>
    {/each}
  </div>
  
</div>



<style>
  .motto {
    font-family: 'Times New Roman';
    font-size: 2em;
    text-align: center;
    color: var(--text);
  }

  .sign-up {
    background-color: var(--surface);
    color: var(--text);
    font-family: 'Times New Roman';
    font-size: 1.5em;
    padding: 0.5em 1em 1em;
    margin: 1em;
  }

  .rewards {
    color: var(--text);
    font-family: 'Times New Roman';
    font-size: 1.5em;
    padding: 0.5em 1em 1em;
    margin: 1em;
  }

  .sign-up h2 {
    font-size: 2em;
    margin: 0.3em 0;
  }

  .rewards h2 {
    font-size: 2em;
    margin: 0.3em 0;
  }

  label {
    display: block;
    font-size: 1.4em;
    margin-bottom: 0.5em;
  }

  input {
    font-size: 1.2em;
    padding: 0.3em 0.5em;
    background-color: var(--bg-deep);
    color: var(--text);
    border: 1px solid var(--border);
  }

  /* accessibility for better visual */
  input:focus {
    outline: none;
    border-color: var(--accent);
  }
 
  input::placeholder {
  color: var(--text-subtle);
}

button {
  font-size: 1em;
  padding: 0.3em 1em;
  background-color: var(--accent);
  color: var(--bg-deep);
  border: 1px solid var(--accent);
  cursor: pointer;
}

  .tiers {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
    gap: 1em;
  }

  .tier {
    background-color: var(--bg);
    border: 1px solid var(--border);
    text-align: center;
    padding: 1em;
  }

  .buy {
    font-size: 1.4em;
    margin: 0;
  }

  .free {
    font-size: 1.2em;
    margin: 0.3em 0 0;
    color: var(--accent);
  }

  .pic {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 0.8em;
  }

  .pic img {
    width: 90px;
    height: auto;
  }

  /* bagels overlaps the one before it */
  .stack {
    flex-direction: column;
  }

  .stack img + img {
    margin-top: -65px;
  }

  .stack img:nth-child(odd) {
    transform: translateX(-50px);
  }

  .stack img:nth-child(even) {
    transform: translateX(10px);
  }
</style>
