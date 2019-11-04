// See https://cp-algorithms.com/string/string-hashing.html
function polynomialRollingHash(str) {
    const p = 31;
    const m = 1e9 + 9;
    let hash = 0;
    let pow = 1;
    for (let i = 0; i < str.length; i++) {
        hash = (hash + str.charCodeAt(i) * pow) % m;
        pow = (pow * p) % m;
    }
    return hash;
}

function padZeros(str, len) {
    let pad = "";
    for (let i = 0; i < len - str.length; i++) {
        pad += "0";
    }
    return pad + str;
}

function getHashColor(str) {
    const color = polynomialRollingHash(str) % 16777216;
    const colorStr = padZeros(color.toString(16), 6);
    return colorStr;
}

function getLuminanceInvertedColor(colorStr) {
    const r = parseInt(colorStr.slice(0, 2), 16);
    const g = parseInt(colorStr.slice(2, 4), 16);
    const b = parseInt(colorStr.slice(4, 6), 16);

    // https://stackoverflow.com/a/3943023/11629344
    if (r * 0.299 + g * 0.587 + b * 0.114 > 186)
        return "000000";
    else
        return "ffffff";
}

const elems = document.getElementsByClassName("page-taxonomy");
for (elem of elems) {
    const bgColor = getHashColor(elem.textContent.trim());
    elem.style.backgroundColor = "#" + bgColor;
    elem.style.color = "#" + getLuminanceInvertedColor(bgColor);
}