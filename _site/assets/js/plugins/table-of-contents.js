/*!
 * Table of Contents Toggle
 * https://github.com/smithtimmytim/brightlycolored.org
 * Copyright (c) 2017 Timothy B. Smith
 * Licensed MIT
 */

var tocToggle = document.getElementById('toc-toggle');
var tableOfContents = document.getElementById('markdown-toc');

function showToc(elem) {
  function getHeight() {
    elem.style.display = 'block';

    var height = elem.scrollHeight + 'px';

    elem.style.disply = '';

    return height;
  };

  var height = getHeight();
  elem.classList.add('js-toc-is-open');
  elem.style.height = height;

  window.setTimeout(function() {
    elem.style.height = '';
  }, 350);
};

function hideToc(elem) {
  elem.style.height = elem.scrollHeight + 'px';

  window.setTimeout(function() {
    elem.style.height = '0';
  }, 1);

  window.setTimeout(function() {
    elem.classList.remove('js-toc-is-open');
  }, 350);
};

function toggleToc(elem) {

  tocToggle.classList.toggle('js-toc-is-open');

  if (elem.classList.contains('js-toc-is-open')) {
    hideToc(elem);
    return;
  }

  showToc(elem);
};

if (tocToggle) {
  tocToggle.addEventListener("click", function(event) {
    toggleToc(tableOfContents);
  });
}
