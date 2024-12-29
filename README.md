# Data URL editor

This is a simple tool I made. Its a simple html page that is a tiny code editor. I have it in a browser bookmark so I can quickly access it. It is useful for when I need to write something down quickly. You can save the text to a file.

## TLDR I WANT A FANCY TEXT EDITOR IN A BROSWER BOOKMARK
Scroll down

## Features
- Save text to a file
- Word count
- Character count
- Selection details
- Dark color theme
- Spaces are shown as dots
- Line numbers

## Technical details

There were some challenges when implementing this. The most problems boil down to weird browser-specific behaviour when dealing with the `contenteditable` attribute. This is why this editor works best on firefox. The editor is an ol element with li elements. The li elements are the individual lines.

The code is in the index.html file. I use inline styles and inline js to minimize the effort needed to get this working. The `build.sh` script aggregates the resources, minifies the css and js files, percent encodes the html file and concatenates it with the content of the `closure` file. The result is a data url that can be entered into the browser's address bar or saved as a bookmark.

It was difficult to render spaces as dots due to the fact that there is no css selector that matches individual characters let alone a space character. To get around this i created my own font using [FontForge](https://fontforge.org/en-US/) which I then used to generate a woff2 file. This file is then base64 encoded and used as a replacement for the parameter of the `url()` function in the `@font-face` rule. The font is then used in the css to render spaces as dots. Because the url rule is "s.woff2" before it is replaced with the base64 encoded font, the editor is still usable by just opening it as the reference stays intact, which is useful for debugging.

I used the [html-minifier](https://www.npmjs.com/package/html-minifier) package from npmjs to minimize the bundled html file.

There were some concerns about the maximum size of a data url in the firefox address but according to sources on google, the limit is 65535 characters.

## Known issues

- The editor does not work well on mobile. Too bad.
- When on the first line, backspacing will not work if the line contains only spaces.
- The editor is not tested on chrome or other browsers. It is best to use firefox.

## Debugging
You can just open the html file directly in the browser. The font will still be loaded and the editor will still work. That way the source code is not minified and hence more readable in the browser console.


## Installation

Put this in your bookmark bar:
```
data:text/html;charset=utf-8,%3C%21DOCTYPE%20html%3E%3Chtml%3E%3Cmeta%20name%3D%22viewport%22%20content%3D%22width%3Ddevice-width%2Cinitial-scale%3D1%22%3E%3Cmeta%20charset%3D%22utf-8%22%3E%3Ctitle%3EE%3C/title%3E%3Cstyle%3E%40font-face%7Bfont-family%3A%27s%27%3Bsrc%3Aurl%28data%3Afont/woff2%3Bbase64%2Cd09GMgABAAAAAAKYAA0AAAAABhgAAAJCAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP0ZGVE0cBmAAgkIIBBEICoEAgQkLCgABNgIkAxAEIAWEKwcqGzEFIC4H7MbyW4gjsKrCVlg2V1%2BrIBGnWsXwU%2BP5/9/vf3Pte75qMjxCVEsqoxO90SwxXiQRurbsEmlfzP/p7tptXGS788OYcqpqwG4nUdNINFLx8D%2B3vWGd0D5RNGSOkn0bqo0U6IUvu1pPL8LC1AsSi4s4uNDx/04Xun3PB6fjwvk/uCZ/FMEB%2BBdFUvvz6/MzpSZXboAT2kgGIgOiqbeQJKTenFskRVK5CHy538r46/Sj1bXchNST%2BoKee9F85KJQ%2BoYABADO3khrfIR0tM6%2B3oAAYAOiQ4cFBPv4ggWBDaBpgg3rw98z618QSD8BpFAAgNApp2%2BsF2Q9DzQwiIYpMA%2BgYTsPVGuDGekba5dT6%2BE3D3YunyH0Tt8/sG9vxjURKxot4HWwY98nDvyzFoVvEeN7rAbt0JDV21FWIEPvrYEIO5//j%2Bb/E7qfo%2BvZIL16g0EFQj0D12sHpIcAgFbXWEBdEz9C0AwpUIjgkADAuBcI2GiBgRhyHwNlwFMEnW1%2BIGiGshVBn4mcwUC/odyjShvCEYAQ085Qxj2Gzkk/NNMxoc9Swu/RbzqZxGzx2rSkxoFkDmzCKNNXEZ1WbzYo7MgG19px%2BNWndeA3sCzSWT8PxU4bbXcOXDI5tA4DrhbDpZvzRVodA%2Bdx0mk%2B2OAmszhwwmxyND9pI3HENJSYEsOiqsxM1BxTd0PCkUxWlGySkzUqU6HAwYhNamc1%2BURskcuRza7FLo0o5TS0UrHRClVdoz6Rwf4FrM9AAAC0tRIAAA%3D%3D%29%20format%28%27woff2%27%29%3Bunicode-range%3AU%2B0020%7Dhtml%7Bfont-family%3Amonospace%3Bbackground%3A%2332353f%3Bcolor%3A%23bdbdbd%3Bfont-size%3A1em%3Bheight%3A100vh%7D%2A%7Bmargin%3A0%7Dli%7Bwidth%3A100%25%3Bborder-top%3A1px%20solid%20%2347475a%3Bborder-left%3A0%3Bborder-right%3A0%3Bfont-family%3A%27s%27%2Cmonospace%7Dli%3A%3Amarker%7Bfont-family%3Amonospace%7Dli%3Alast-child%7Bborder-bottom%3A1px%20solid%20%2347475a%7Dol%7Bpadding-top%3A1em%3Bmax-height%3Acalc%28100vh%20-%204em%29%3Boverflow-y%3Ascroll%3Boverflow-x%3Ahidden%3Bword-break%3Abreak-all%7Dol%3Afocus%7Boutline%3A0%7D%23info%7Bmargin-bottom%3A1em%3Bposition%3Afixed%3Bz-index%3A1%3Bbottom%3A0%3Bwidth%3Acalc%28100%25%20-%206em%29%3Bpadding-left%3A2em%3Bpadding-right%3A2em%3Bborder-radius%3A30px%7D.flex-util%7Bdisplay%3Aflex%3Bjustify-content%3Aspace-between%3Bgap%3A4em%3Bflex-direction%3Arow%7D%3C/style%3E%3Cscript%3Ewindow.onload%3D%28%29%3D%3E%7Bdocument.querySelector%28%22html%22%29%3Blet%20r%3Ddocument.querySelector%28%22ol%22%29%2Cn%3D%28document.addEventListener%28%22keydown%22%2Ce%3D%3E%7Bvar%20t%2Cn%2Cl%3Be.ctrlKey%26%26%22v%22%3D%3D%3De.key%26%26setTimeout%28%28%29%3D%3E%7Br.querySelectorAll%28%22br%22%29.forEach%28e%3D%3E%7Be.nextElementSibling%26%26%22BR%22%3D%3D%3De.nextElementSibling.nodeName%26%26e.nextElementSibling.remove%28%29%7D%29%7D%2C50%29%2Ce.ctrlKey%26%26%22s%22%3D%3D%3De.key%26%26%28e.preventDefault%28%29%2Ct%3Dr.innerHTML%2Cr.innerHTML%3Dr.innerHTML.replaceAll%28%22%3Cbr%3E%22%2C%22%CD%B8%22%29%2Cl%3Dr.innerText%2Cl%3Dnew%20Blob%28%5Bl.replaceAll%28%22%CD%B8%22%2C%22%22%29%5D%2C%7Btype%3A%22text/plain%22%7D%29%2C%28n%3Ddocument.createElement%28%22a%22%29%29.href%3DURL.createObjectURL%28l%29%2Cn.download%3D%22note.txt%22%2Cn.click%28%29%2Cr.innerHTML%3Dt%29%2C%22Enter%22%3D%3D%3De.key%26%26%28t%3D%28%22%23text%22%3D%3D%3D%28n%3D%28l%3Dwindow.getSelection%28%29%29.getRangeAt%280%29%29.startContainer.nodeName%3Fn.startContainer.parentElement%3An.startContainer%29.closest%28%22li%22%29%29%26%26%22%22%3D%3D%3Dt.innerText.trim%28%29%26%26%28e.preventDefault%28%29%2C%28n%3Ddocument.createElement%28%22li%22%29%29.innerHTML%3D%22%3Cbr%3E%22%2Ct.parentNode.insertBefore%28n%2Ct.nextSibling%29%2C%28t%3Ddocument.createRange%28%29%29.setStart%28n%2C0%29%2Ct.collapse%28%210%29%2Cl.removeAllRanges%28%29%2Cl.addRange%28t%29%29%2C%22Backspace%22%3D%3D%3De.key%26%26%28l%3D%28%22%23text%22%3D%3D%3D%28n%3Dwindow.getSelection%28%29.getRangeAt%280%29%29.startContainer.nodeName%3Fn.startContainer.parentElement%3An.startContainer%29.closest%28%22li%22%29%29%26%26null%3D%3D%3Dl.previousElementSibling%26%26%22%22%3D%3D%3Dl.innerText.trim%28%29%26%26%21l.innerText.endsWith%28%22%20%22%29%26%26e.preventDefault%28%29%7D%29%2Cdocument.addEventListener%28%22click%22%2Ce%3D%3E%7Bvar%20t%2Cn%3B%22HTML%22%3D%3D%3De.target.tagName%26%26%28e%3Dr.querySelector%28%22li%3Alast-child%22%29%2Ct%3Ddocument.createRange%28%29%2Cn%3Dwindow.getSelection%28%29%2Ct.setStart%28e%2Ce.childNodes.length%29%2Ct.collapse%28%210%29%2Cn.removeAllRanges%28%29%2Cn.addRange%28t%29%29%7D%29%2Cdocument.getElementById%28%22wordcount%22%29%29%2Cl%3Ddocument.getElementById%28%22charcount%22%29%2Ct%3Ddocument.getElementById%28%22selectiondetails%22%29%3Bfunction%20e%28%29%7Bvar%20e%3Dr.innerText.trim%28%29%2Ct%3De.split%28/%5Cs%2B/%29.filter%28e%3D%3E0%3Ce.length%29%3Bn.textContent%3Dt.length%2Cl.textContent%3De.length%7Dr.addEventListener%28%22input%22%2Ce%29%2Cdocument.addEventListener%28%22selectionchange%22%2C%28%29%3D%3E%7Bvar%20e%3Dwindow.getSelection%28%29%3Bt.textContent%3De.toString%28%29.length%7D%29%2Ce%28%29%7D%3C/script%3E%3Cbody%3E%3Col%20contenteditable%3E%3Cli%3EType%20Here%3C/li%3E%3C/ol%3E%3Cdiv%20style%3D%22margin-left%3A1em%3Bmargin-right%3A1em%22%3E%3Cdiv%20id%3D%22info%22%20style%3D%22background-color%3A%234e566e%22%20class%3D%22flex-util%22%3E%3Cp%3ECtrl%20%2B%20S%20to%20save%3C/p%3E%3Cdiv%20class%3D%22flex-util%22%3E%3Cp%3EWords%3A%20%3Cspan%20id%3D%22wordcount%22%3E%23%23%23%3C/span%3E%3C/p%3E%3Cp%3ECharacters%3A%20%3Cspan%20id%3D%22charcount%22%3E%23%23%23%3C/span%3E%3C/p%3E%3Cp%3ESelection%3A%20%3Cspan%20id%3D%22selectiondetails%22%3E0%3C/span%3E%3C/p%3E%3C/div%3E%3C/div%3E%3C/div%3E%3C/body%3E%3C/html%3E
```