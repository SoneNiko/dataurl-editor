# Data URL editor

This is a simple tool I made. Its a simple html page that is a tiny code editor. I have it in a browser bookmark so I can quickly access it. It is useful for when I need to write something down quickly. You can save the text to a file.

Put this in your bookmark bar:
```
data:text/html;charset=utf-8,%3C%21DOCTYPE%20html%3E%3Chtml%3E%3Cmeta%20name%3D%22viewport%22%20content%3D%22width%3Ddevice-width%2Cinitial-scale%3D1%22%3E%3Cmeta%20charset%3D%22utf-8%22%3E%3Ctitle%3EE%3C/title%3E%3Cstyle%3Ehtml%7Bfont-family%3Amonospace%3Bbackground%3A%2332353f%3Bcolor%3A%23bdbdbd%3Bfont-size%3A1em%3Bheight%3A100vh%7D%2A%7Bmargin%3A0%7Dli%7Bwidth%3A100%25%3Bborder-top%3A1px%20solid%20%2347475a%3Bborder-left%3A0%3Bborder-right%3A0%7Dli%3Alast-child%7Bborder-bottom%3A1px%20solid%20%2347475a%7Dol%7Bpadding-top%3A1em%7Dol%3Afocus%7Boutline%3A0%7D%23info%7Bmargin-bottom%3A1em%3Bposition%3Aabsolute%3Bz-index%3A1%3Bbottom%3A0%3Bwidth%3Acalc%28100%25%20-%206em%29%3Bpadding-left%3A2em%3Bpadding-right%3A2em%3Bborder-radius%3A30px%7D.flex-util%7Bdisplay%3Aflex%3Bjustify-content%3Aspace-between%3Bgap%3A4em%3Bflex-direction%3Arow%7D%3C/style%3E%3Cscript%3Ewindow.onload%3D%28%29%3D%3E%7Bdocument.querySelector%28%22html%22%29%3Blet%20l%3Ddocument.querySelector%28%22ol%22%29%2Cn%3D%28document.addEventListener%28%22keydown%22%2Ce%3D%3E%7Bvar%20t%3Be.ctrlKey%26%26%22s%22%3D%3D%3De.key%26%26%28e.preventDefault%28%29%2Ce%3Dl.innerText.replace%28%22%0A%0A%22%2C%22%0A%22%29%2Ce%3Dnew%20Blob%28%5Be%5D%2C%7Btype%3A%22text/plain%22%7D%29%2C%28t%3Ddocument.createElement%28%22a%22%29%29.href%3DURL.createObjectURL%28e%29%2Ct.download%3D%22note.txt%22%2Ct.click%28%29%29%7D%29%2Cdocument.addEventListener%28%22keydown%22%2Ce%3D%3E%7Bvar%20t%2Cn%3B%22Enter%22%3D%3D%3De.key%26%26%28n%3D%28t%3Dwindow.getSelection%28%29%29.getRangeAt%280%29.startContainer.closest%28%22li%22%29%29%26%26%22%22%3D%3D%3Dn.innerText.trim%28%29%26%26%28e.preventDefault%28%29%2C%28e%3Ddocument.createElement%28%22li%22%29%29.innerHTML%3D%22%3Cbr%3E%22%2Cn.parentNode.insertBefore%28e%2Cn.nextSibling%29%2C%28n%3Ddocument.createRange%28%29%29.setStart%28e%2C0%29%2Cn.collapse%28%210%29%2Ct.removeAllRanges%28%29%2Ct.addRange%28n%29%29%7D%29%2Cdocument.addEventListener%28%22keydown%22%2Ce%3D%3E%7Bvar%20t%3B%22Backspace%22%3D%3D%3De.key%26%26%28t%3Dwindow.getSelection%28%29.getRangeAt%280%29.startContainer.closest%28%22li%22%29%29%26%26null%3D%3D%3Dt.previousElementSibling%26%26%22%22%3D%3D%3Dt.innerText.trim%28%29%26%26e.preventDefault%28%29%7D%29%2Cdocument.addEventListener%28%22click%22%2Ce%3D%3E%7Bvar%20t%2Cn%3B%22HTML%22%3D%3D%3De.target.tagName%26%26%28e%3Dl.querySelector%28%22li%3Alast-child%22%29%2Ct%3Ddocument.createRange%28%29%2Cn%3Dwindow.getSelection%28%29%2Ct.setStart%28e%2Ce.childNodes.length%29%2Ct.collapse%28%210%29%2Cn.removeAllRanges%28%29%2Cn.addRange%28t%29%29%7D%29%2Cdocument.getElementById%28%22wordcount%22%29%29%2Co%3Ddocument.getElementById%28%22charcount%22%29%2Ct%3Ddocument.getElementById%28%22selectiondetails%22%29%3Bfunction%20e%28%29%7Bvar%20e%3Dl.innerText.trim%28%29%2Ct%3De.split%28/%5Cs%2B/%29.filter%28e%3D%3E0%3Ce.length%29%3Bn.textContent%3Dt.length%2Co.textContent%3De.length%7Dl.addEventListener%28%22input%22%2Ce%29%2Cdocument.addEventListener%28%22selectionchange%22%2C%28%29%3D%3E%7Bvar%20e%3Dwindow.getSelection%28%29%3Bt.textContent%3De.toString%28%29.length%7D%29%2Ce%28%29%7D%3C/script%3E%3Cbody%3E%3Col%20contenteditable%3E%3Cli%3EType%20Here%3C/li%3E%3C/ol%3E%3Cdiv%20style%3D%22margin-left%3A1em%3Bmargin-right%3A1em%22%3E%3Cdiv%20id%3D%22info%22%20style%3D%22background-color%3A%234e566e%22%20class%3D%22flex-util%22%3E%3Cp%3ECtrl%20%2B%20S%20to%20save%3C/p%3E%3Cdiv%20class%3D%22flex-util%22%3E%3Cp%3EWords%3A%20%3Cspan%20id%3D%22wordcount%22%3E%23%23%23%3C/span%3E%3C/p%3E%3Cp%3ECharacters%3A%20%3Cspan%20id%3D%22charcount%22%3E%23%23%23%3C/span%3E%3C/p%3E%3Cp%3ESelection%3A%20%3Cspan%20id%3D%22selectiondetails%22%3E%23%23%23%3C/span%3E%3C/p%3E%3C/div%3E%3C/div%3E%3C/div%3E%3C/body%3E%3C/html%3E
```