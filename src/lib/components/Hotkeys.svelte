<script lang="ts">
  let is_b_down,
    is_o_down,
    is_r_down,
    is_c_down = false;

  let is_alt_down = $state(false);

  function key_action_runner(e) {
    switch (e.key) {
      case 'b':
        document.getElementById('homeID').click();
        break;
      case 'o':
        document.getElementById('orderID').click();
        break;
      case 'r':
        document.getElementById('rewardsID').click();
        break;
      case 'c':
        document.getElementById('cartID').click();
        break;
    }
  }

  function on_key_down(e) {
    if (e.repeat) return;

    switch (e.key) {
      case 'b':
        is_b_down = true;
        e.preventDefault();
        break;
      case 'o':
        is_o_down = true;
        e.preventDefault();
        break;
      case 'r':
        is_r_down = true;
        break;
      case 'c':
        is_c_down = true;
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

    if (
      is_o_down ||
      is_b_down ||
      is_r_down ||
      is_c_down ||
      is_alt_down
    ) {
      key_action_runner(e);
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
      <div>[r] (rewards)</div>
      <div>[c] (cart)</div>
    </div>
  </div>
{/if}

<style>
  .text {
    font-size: 1.5em;
    margin: 0.4em;
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
