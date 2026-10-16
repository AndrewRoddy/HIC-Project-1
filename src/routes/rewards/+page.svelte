<script lang="ts">
  import '../../app.css';
  import { onMount } from 'svelte';
  import {
    rewards,
    loadRewards,
    setName,
    tiers,
    freeAvailable
  } from '$lib/state/rewards.svelte';

  let name = $state('');

  // load the saved name and points once the page is in the browser
  onMount(() => {
    loadRewards();
    name = rewards.name;
  });

  // input sanitation
  function cleanName() {
    name = name.replace(/[^\p{L}\s'-]/gu, '');
  }

  function handleSubmit(event: SubmitEvent) {
    event.preventDefault(); // stop the page from reloading
    const trimmed = name.trim();
    if (!trimmed) return;

    setName(trimmed);
  }

  // free bagels still available to use at checkout, and the next tier to unlock
  let available = $derived(freeAvailable());
  let next = $derived(tiers.find((tier) => rewards.points < tier.bagels));
</script>

<div class="motto">
  <h1>Eat bagels. Earn rewards. Get free dough.</h1>
</div>

<div class="sign-up">
  <h2>{rewards.name ? `Welcome, ${rewards.name}` : 'Sign Up'}</h2>
  <label for="name">Enter your preferred name</label>
  <form class="name-row" onsubmit={handleSubmit}>
    <input
      id="name"
      type="text"
      maxlength="35"
      placeholder="John Smith"
      oninput={cleanName}
      bind:value={name}
    />
    <button type="submit" disabled={!name.trim()}>Submit</button>
  </form>
</div>

<div class="rewards">
  <h2>Rewards</h2>

  <p class="progress">
    Bagels bought: {rewards.points}.
    Free bagels available: {available}.
    {#if next}
      Buy {next.bagels - rewards.points} more to unlock {next.free} free.
    {:else}
      You've unlocked every reward!
    {/if}
  </p>

  <div class="tiers">
    {#each tiers as tier (tier.bagels)}
      <div class="tier" class:reached={rewards.points >= tier.bagels}>
        <div class="pic {tier.layout}">
          {#each { length: tier.free } as _}
            <img src="/bagels/{tier.flavor}-Bagel.webp" alt="{tier.flavor} bagel" />
          {/each}
        </div>
        <p class="buy">Buy {tier.bagels}</p>
        <p class="free">Get {tier.free} free</p>
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

  /* input and button side by side */
  .name-row {
    display: flex;
    gap: 0.5em;
  }

  input {
    font-size: 1.2em;
    padding: 0.3em 0.5em;
    background-color: var(--bg-deep);
    color: var(--text);
    border: 1px solid var(--border);
    border-radius: 0.5em;
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
    font-family: inherit;
    font-size: 1em;
    padding: 0.3em 1em;
    background-color: var(--accent);
    color: var(--bg-deep);
    border: 1px solid var(--accent);
    cursor: pointer;
    border-radius: 0.5em;
  }

  button:hover:not(:disabled) {
    background-color: var(--accent-hover);
    border-color: var(--accent-hover);
  }

  button:disabled {
    background-color: var(--surface-hover);
    border-color: var(--border);
    color: var(--text-subtle);
    cursor: not-allowed;
  }

  .progress {
    font-size: 1em;
    margin: 0 0 1em;
    color: var(--text-muted);
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
    display: flex;
    flex-direction: column;
  }

  /* tiers the user has already unlocked */
  .tier.reached {
    border-color: var(--accent);
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
    transform: translateX(-30px);
  }

  .stack img:nth-child(even) {
    transform: translateX(30px);
  }

  .stack img:only-child {
  transform: none;
}
</style>