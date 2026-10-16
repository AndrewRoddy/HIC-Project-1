<script lang="ts">
</script>

<h1 class="page-header">About Us</h1>

<div class="about">
    <section class="desc">

        <p>
            Bagl was created by 4 individuals by the Names of
        </p>

        <div class="founders">
            <ul class="f-list">
                <li>Andrew Roddy</li>
                <li>Tatiana Tkacheva</li>
                <li>Savar Srestha</li>
                <li>Michael Bonanno</li>
            </ul>
        </div>
    </section>

    <section class="story">

        <p>
            One day our friend and fellow founder Andrew was really hungry for a bagel.
            Unfortunately for Andrew, at the time, he had no convenient way to get a good 
            bagel he knew he'd enjoy delivered to him easily. So, Andrew pulled us four 
            together as a team. From there he told us his vision that he never wants to have 
            this feeling ever again. So, with the inspiration provided to us from Andrew, 
            we started Bagl. With hopes to reach others who felt the same as Andrew, and 
            never leave another bagel lover behind.
        </p>

        <p>
            To us here at Bagl, you, our customers, are our why. We are truly passionate 
            in our idea, and we want nothing more than to pass that onto our customers. 
            That's why we offer our member specials on bagels. More than anything, we want
            our customers to enjoy a phenomal bagel they want their own way.
        </p>

    </section>
</div>

<style>
    .page-header {
        color: var(--text);
        padding-left: 0.25em;
        font-size: 3.5em;
    }

    .about {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 32px 40px;
        padding: 1em 1em 1em 1.5em;
    }

    .desc,
    .story {
        font-size: 1.5em;
    }

    .desc {
        display: flex;
        flex-direction: column;
        color: var(--text);
    }

    .story {
        color: var(--text-muted);
    }

    .desc p,
    .story p {
        margin: 0 0 1em;
        line-height: 1.7;
    }

    .founders {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .f-list {
         display: flex;
        flex-direction: column;
        gap: 0.75em;
        list-style: none;
        margin: 0;
        padding: 0;
        
    }

    @media (max-width: 700px) {
        .about {
            grid-template-columns: 1fr;
        }
    }
</style>
