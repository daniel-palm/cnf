// ==UserScript==
// @match https://marval.basefarm.com/
// ==/UserScript==

const meta = document.createElement('meta');
meta.name = "color-scheme";
meta.content = "light";
document.head.appendChild(meta)
