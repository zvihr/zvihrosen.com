/* zvihrosen.com — shared top navigation
   Inject the header & footer into every page so you only edit them here.
   Pages opt in by adding:
     <script src="nav.js" defer></script>
*/

(function () {
  const NAV_LINKS = [
    { href: "index.html",      label: "Home" },
    { href: "bio.html",        label: "About" },
    { href: "rosenCV.pdf",     label: "CV" },
    { href: "research.html",   label: "Research" },
    { href: "teaching.html",   label: "Teaching" },
    { href: "students.html",   label: "Students" },
    { href: "notes-code.html", label: "Notes & Code" },
    { href: "misc.html",       label: "Misc" },
  ];

  // Best-effort current-page detection (filename only).
  const path = (location.pathname.split("/").pop() || "index.html").toLowerCase();

  function isCurrent(href) {
    const h = href.toLowerCase();
    if (h.endsWith(".pdf")) return false;
    if (path === "" && h === "index.html") return true;
    return path === h;
  }

  function buildNav() {
    const nav = document.createElement("nav");
    nav.className = "nav";
    nav.setAttribute("aria-label", "Primary");

    const linksHTML = NAV_LINKS
      .map(({ href, label }) =>
        `<li><a href="${href}"${isCurrent(href) ? ' class="is-current" aria-current="page"' : ""}>${label}</a></li>`
      )
      .join("");

    nav.innerHTML = `
      <div class="nav__inner">
        <a href="index.html" class="nav__brand">
          Zvi&nbsp;Rosen
        </a>
        <button class="nav__toggle" type="button" aria-expanded="false" aria-controls="primary-nav">
          Menu
        </button>
        <ul class="nav__links" id="primary-nav">${linksHTML}</ul>
      </div>
    `;

    return nav;
  }

  function buildFooter() {
    const footer = document.createElement("footer");
    footer.className = "footer";
    footer.innerHTML = `
      <div class="footer__inner">
        <div class="footer__dept">
          <a href="http://www.math.fau.edu/">Department of Mathematical Sciences</a> ·
          <a href="http://www.fau.edu">Florida Atlantic University</a><br>
          777 Glades Rd, Boca Raton, FL · Office: Science Building (SE-43) 224
        </div>
        <div>
          <a href="mailto:rosenz@fau.edu">rosenz@fau.edu</a>
        </div>
      </div>
    `;
    return footer;
  }

  function mount() {
    const site = document.createElement("div");
    site.className = "site";

    const nav = buildNav();

    // Wrap existing body content as <main> if not already wrapped.
    let main = document.querySelector("main");
    if (!main) {
      main = document.createElement("main");
      // Move all current body children into main (the nav we'll prepend separately).
      while (document.body.firstChild) {
        main.appendChild(document.body.firstChild);
      }
    } else {
      main.remove();
    }

    const footer = buildFooter();

    site.appendChild(nav);
    site.appendChild(main);
    site.appendChild(footer);

    document.body.appendChild(site);

    // Sticky-nav scroll state
    const onScroll = () => {
      if (window.scrollY > 4) nav.classList.add("is-scrolled");
      else nav.classList.remove("is-scrolled");
    };
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });

    // Mobile menu toggle
    const toggle = nav.querySelector(".nav__toggle");
    const list = nav.querySelector(".nav__links");
    toggle.addEventListener("click", () => {
      const open = list.classList.toggle("is-open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
    });
    list.addEventListener("click", (e) => {
      if (e.target.tagName === "A") list.classList.remove("is-open");
    });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mount);
  } else {
    mount();
  }
})();
