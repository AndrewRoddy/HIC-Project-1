<script lang="ts">
  import '../../app.css';
  import { page } from '$app/state';
  import Bagel from '../../lib/components/Bagel.svelte';
  const path = $derived(
    page.url.searchParams.get('path')?.split('/').pop() || 'Cinnamon-Raisin-Bagel.webp'
  );
  const name = $derived(
    page.url.searchParams.get('name') ?? 'Regular Bagel'
  );
  const price = $derived(
    Number(page.url.searchParams.get('price') ?? 99.99)
  );
</script>

<h1 class="page-header">Bagel Info</h1>

<div class="bagel-section">
  <Bagel
    img={path}
    name={name}
    price={price}
  />
</div>

<style>
  .page-header {
    text-align: left;
    padding-left: 0.75em;
    color: var(--text)
  }

  .bagel-section {
    padding: 1em;
  }
</style>
