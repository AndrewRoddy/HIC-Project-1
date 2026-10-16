<script>
  import { resolve } from '$app/paths';
</script>

<div class="footer">
  <h1>BAGL</h1>
  <div class="about">
    <a id="aboutID" href={resolve('/about')}>About</a>
  </div>
  <br />
  <div class="subtext">
    Press '?', 'Alt', or 'Option' to display keyboard
    shortcuts.
  </div>
  <br />
  <div class="subtext">© 2026 all rights reserved.</div>
</div>

<style>
  .footer {
    flex-grow: 1;
    padding-bottom: 5em;
    text-align: center;
    background-color: var(--bg-deep);
    color: var(--text);
    background-color: var(--bg-deep);
    border-top: 0.5px solid var(--border);
  }

  .footer h1 {
    font-size: 10em;
    margin-bottom: 0em;
  }

  .subtext {
    font-size: 1.5em;
    color: var(--text-subtle);
  }

  #aboutID {
    font-size: 1.5em;
    color: var(--text-subtle);
  }
</style>
