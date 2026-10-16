<script lang="ts">
  import { resolve } from "$app/paths";
  import { onMount } from "svelte";
  import { rewards, loadRewards } from "$lib/state/rewards.svelte";

  onMount(loadRewards);
</script>

<h1 class="page-header">
  {rewards.name ? `Welcome back, ${rewards.name}!` : 'Welcome to Bagl!'}
</h1>

<div class="home">
  <section class="mission" aria-labelledby="mission-title">
    <h2 id="mission-title">A good bagel makes all the difference.</h2>

    <p>
      Here at Bagl we understand how important a good bagel is.
      We started Bagl so that bagel lovers could have an easy and simple
      way to get bagels of all types delivered to them quickly. Nothing is more important than a good bagel, and here at Bagl
      we offer nothing but the absolute finest bagels around. All which
      can be delivered straight to your house. I mean come on, it doesn't
      get much better than that.
    </p>

    <p>
      Explore our selection, find your next favorite, 
      and enjoy the perks of being a Bagl member!
    </p>
    <div class="actions">
      <a class="action-button" href={resolve('/order')}>
        Order Now
      </a>

      <a class="action-button" href={resolve('/rewards')}>
        Become a Member
      </a>
    </div>
  </section>

  <aside class="membership" aria-labelledby="perks-title">
    <ul class="perks">
      <li class="perk">
        <p>Buy two bagels and get your third free!</p>
      </li>

      <li class="perk">
        <ul class="exponential-equations">
          <li>Buy 2 get 1 free!</li>
          <li>Buy 4 get 2 free!</li>
          <li>Buy 8 get 3 free!</li>
          <li>Buy 16 get 4 free!</li>
          <li>Buy 32 get 5 free!</li>
        </ul>
      </li>
    </ul>
  </aside>
</div>

<style>  
  .page-header {
    color: var(--text);
    text-align: left;
    padding-left: 0.25em;
    font-size: 3.5em;

  }

  .home {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    gap: 32px 40px;
    align-items: start;
    padding: 1em;
    padding-left: 1.5em;
  }

  .mission {
    min-width: 0;
    color: var(--text);
    font-size: 1.5em;
  }

  .membership {
    width: 100%;
    max-width: 800px;
    justify-self: center;
    align-self: start;
  }

  h2 {
    margin-top: 0;
    color: var(--text);
  }

  .mission p {
    margin: 0 0 1em;
    line-height: 1.7;
    color: var(--text-muted);
  }

  .perks {
    display: grid;
    grid-template-columns: minmax(0, 1fr);
    justify-items: center;
    gap: 16px;
    list-style: none;
    margin: 0;
    padding: 0;
    color: var(--text);
  }

  .perk {
    box-sizing: border-box;
    max-width: 500px;
    padding: 24px;
    background-color: var(--surface);
    border: 1px solid var(--accent);
    color: var(--text);
    border-radius: 1em;
    font-size: 2em;
  }

  .perk p{
    margin: 0;
    line-height: 1.6;
    color: var(--text);
  }

  .exponential-equations {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: 8px;
    color: var(--text);
    line-height: 1.6;
    max-width: 500px;
    width: 250px;
  }

  .actions {
    grid-column: 1 / -1;
    display: flex;
    padding-top: 1em;
    justify-content: left;
    flex-wrap: wrap;
    gap: 16px;
  }

  .action-button {
    box-sizing: border-box;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 160px;
    min-height: 38px;
    padding: 8px 16px;
    border: none;
    border-radius: .5em;
    background-color: var(--accent);
    color: var(--bg-deep);
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    font-family:
      'Trebuchet MS', 'Lucida Sans Unicode',
      'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    font-size: 1.2em;
  }

  .action-button:hover{
    background-color: var(--accent-hover);
  }

  .action-button:focus-visible {
    outline: 2px solid var(--text);
    outline-offset: 3px;
  }
</style>
