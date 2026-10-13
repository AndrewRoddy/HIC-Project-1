<script lang="ts">
  import '../../app.css';
</script>

<div class="rewards">
  <div class="motto">
    <h1>Eat bagels. Earn rewards. Get free dough.</h1>
  </div>

  <div class="sign">
    <button class="sign-up" onclick={signUp}> SIGN UP NOW </button>
  </div>
</div>


<style>
  .motto {
    font-family: 'Times New Roman';
    font-size: 2em;
    text-align: center;
    color: var(--text);
  }

  .sign {
    text-align: center;
  }

  .sign-up {
    background-color: var(--accent);
    font-family: 'Times New Roman';
    font-size: 2em;
    border-radius: 0.5em;
    border: 0;
  }

  .sign-up:hover {
    transform: scale(1.05);
  }
</style>
