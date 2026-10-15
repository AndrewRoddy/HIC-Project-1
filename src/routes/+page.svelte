<script lang="ts">
  
</script>

<div class="content">
  <h1 class="motto">Welcome to Bagl!</h1>

  <div class="mission">
    <p class="mission-text">Here at Bagl we understand how important a good bagel is.
    We started Bagl so that bagel lovers could have an easy and simple
    way to get bagels of all types delivered to them quickly. Nothing is more important than a good bagel, and here at Bagl
    we offer nothing but the absolute finest bagels around. All which
    can be delivered straight to your house. I mean come on, it doesn't
    get much better than that.</p>
  </div>

  <div class="button-outer">
    <a href="/order" class="button">Order Now</a>
  </div>

  <div class="perks-list">
    <h3 class="perk-desc">Become a member today and enjoy our wonderful perks</h3>

    <ul class="perks">
      <li class="perk">
        <p>Buy your first bagel and get your second free!</p>
      </li>
      <li class="perk">
        <p>Once a member, every 4 bagels you buy you get 1 free!</p>
      </li>
    </ul>

    <div class="member-button-outer">
      <a href="/rewards" class="button">Become a Member</a>
    </div>
  </div>
</div>


<style>
  .content {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 1rem;
    text-align: left;
  }
  
  .motto {
    font-family: 'Times New Roman';
    font-size: 3em;
    color: var(--text);
    text-align: center;
  }

  .mission-text {
    font-family: 'Times New Roman';
    font-size: 2em;
    color: var(--text);
  }

  .button-outer {
    text-align: center;
  }

  .button {
    display: inline-block;
    background-color: var(--accent);
    color: black;
    text-decoration: none;
    font-family: 'Times New Roman';
    font-size: 3em;
    padding: 0.1em 0.4em;
    border-radius: 0.5em;
    border: 0;
  }

  .button:hover {
    transform: scale(1.05);
  }

  .perks-list {
    max-width: 600px;
    margin: 0 auto;
    padding: 0 1rem;
  }

  .perk-desc {
    font-family: 'Times New Roman';
    font-size: 2em;
    text-align: center;
    color: var(--text);
    padding-top: 100px;
    padding-bottom: 25px;
  }

  .perks {
    font-family: 'Times New Roman';
    color: var(--text);
    list-style: none;
    padding: 0;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 25px;
  }

  .perk {
    border: 2px solid var(--accent);
    border-radius: 10px;
    padding: 1rem;
    text-align: left;
    font-size: 1.3em;
  }

  .member-button-outer {
    padding-top: 50px;
    text-align: center;
  }
</style>
