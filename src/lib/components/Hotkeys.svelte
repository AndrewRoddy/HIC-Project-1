<script lang="ts">
  let is_alt_down = $state(false);

  function on_key_down(e: KeyboardEvent) {
    // Doesn't set it again if its the same key pressed
    if (e.repeat) return;

    // Makes ctrl/meta key bypass my hotkeys
    if (e.ctrlKey || e.metaKey) return;

    // Doesn't count input field keys
    if (e.target instanceof HTMLElement) {
      if (
        e.target.isContentEditable ||
        e.target.tagName === 'INPUT' ||
        e.target.tagName === 'TEXTAREA' ||
        e.target.tagName === 'SELECT'
      ) {
        return;
      }
    }

    // Sets key presses to true
    switch (e.key) {
      case 'b':
        document.getElementById('homeID')?.click();
        e.preventDefault();
        break;
      case 'o':
        document.getElementById('orderID')?.click();
        e.preventDefault();
        break;
      case 'h':
        document.getElementById('historyID')?.click();
        e.preventDefault();
        break;
      case 'r':
        document.getElementById('rewardsID')?.click();
        e.preventDefault();
        break;
      case 'c':
        document.getElementById('cartID')?.click();
        e.preventDefault();
        break;
      case 'Alt':
        if (is_alt_down) {
          is_alt_down = false;
        } else {
          is_alt_down = true;
        }
        e.preventDefault();
        break;
    }
  }
</script>

<svelte:window on:keydown={on_key_down} />

{#if is_alt_down}
  <div class="hotkey-container">
    <div class="text">Keyboard Shortcuts</div>
    <div class="keys">
      <div>[b] (home)</div>
      <div>[o] (order)</div>
      <div>[h] (history)</div>
      <div>[r] (rewards)</div>
      <div>[c] (cart)</div>
    </div>
  </div>
{/if}

<style>
  .text {
    font-size: 1.5em;
    margin: 0.4em;
    color: var(--text);
  }

  .hotkey-container {
    padding: 0.5em;
    justify-content: center;
    text-align: center;

    /* Navbar colors */
    background-color: var(--bg-deep);
    border-bottom: 0.5px solid var(--border);
    color: var(--accent);
  }

  .keys {
    justify-content: center;
    display: flex;
    gap: 1.4em;

    /* Navbar colors */
    background-color: var(--bg-deep);
    color: var(--accent);
  }

  .keys div {
    color: var(--bg-deep);
    background-color: var(--text);
    border: 0.01em solid var(--border);
    padding: 0.2em;
    border-radius: 0.2em;
    font-size: 1.5em;
    font-family: tahoma;
  }
</style>
