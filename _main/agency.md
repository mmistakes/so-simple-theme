---
layout: page
excerpt: "Artineering Agency & RnD"
entries_layout: grid
show_excerpts: false
show_titles: false
search: true
---

<!-- AGENCY -->

<div class="agency-header">
  <img src="/images/logo.png" alt="Artineering logo"/>
  <h3> We are a computer graphics company. We develop new technology for existing production pipelines. Our implementations work in real-time art-directed workflows. We offer support and motivate the creative flow and exploration of artists. </h3>
</div>


<!-- SERVICES -->

<div class="full-width agency-banner agency-table">
    <div class="agency-column">
      <h3> Cool service 1 </h3>
      <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
    </div>
    <div class="agency-column">
      <h3> Cool service 2 </h3>
      <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
    </div>
    <div class="agency-column">
      <h3> Cool service 3 </h3>
      <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
    </div>
    <div class="agency-column">
      <h3> Cool service 4 </h3>
      <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
    </div>
</div>


<!-- PROJECTS -->

<div>
  <div class ="agency-title">
    <h1> Projects </h1>
  </div>
  <div class="agency-projects">
    {% include documents-collection.html collection='projects' sort_by=page.sort_by sort_order=page.sort_order %}
  </div>
</div>


<!-- OUR PROCESS -->

<div class="full-width agency-banner">
  <div class ="agency-title">
    <h1> Our Process </h1>
  </div>
  <div class="agency-header">
    <h3> We are a computer graphics company. We develop new technology for existing production pipelines. </h3>
    <img src="/images/logo.png" alt="Artineering logo"/>
  </div>
<!--Toggle Headlines-->
  <div class="flex-process-headline">
    <ol class="process-headlines">
      <li data-title="slide-1" class="process-active">
        <h3>Slider 1</h3>
      </li>
      <li data-title="slide-2">
        <h3>Slider 2</h3>
      </li>
      <li data-title="slide-3">
        <h3>Slider 3</h3>
      </li>
    </ol>
  </div>
<!--Toggle Text-->
  <div class="flex-process-description">
    <ol class="process-descriptions">
      <li id="slide-1" data-title="slide-1" onclick="publicKG.toggleTabDescription(this)">
        <p>Text for slider 1</p>
      </li>
      <li id="slide-2">
        <p>Text for slider 2</p>
      </li>
      <li id="slide-3">
        <p>Text for slider 3</p>
      </li>
    </ol>
  </div>
</div>



<!-- FEATURED PARTNERS -->

<div class="landing-clients agency-title">
  <h1> Featured Partners </h1>
  <div class="landing-clients-grid">
    <div class="landing-client">
      <a href="http://www.taikostudios.com/">
        <img src="/images/clients/Taiko.jpg" alt="Taiko Studios logo"/>
      </a>
    </div>
    <div class="landing-client">
      <a href="http://www.nuctopus.com/">
        <img src="/images/clients/Nuctopus.png" alt="Nuctopus logo"/>
      </a>
    </div>
    <div class="landing-client">
      <a href="http://www.studioaixa.com/">
        <img src="/images/clients/Aixa.png" alt="Studio Aixa logo"/>
      </a>
    </div>
  <div>
</div>




<!-- landing page stylesheet -->
<link rel="stylesheet" href="{{ '/assets/css/landing.css' | relative_url }}">
