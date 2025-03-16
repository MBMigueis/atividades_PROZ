// Capturando elementos
const titulo = document.getElementById("titulo")
const listaNaoOrdenada = document.querySelector("ul")
const linkProz = document.querySelector("a")
const listaOrdenada = document.getElementById("lista-ordenada")

// Adicionando conteúdo textual
titulo.innerText = "Manipulação de DOM"
linkProz.innerText = "Site da Proz Educação"

// Preenchendo lista não ordenada
listaNaoOrdenada.innerHTML = `
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
`

// Preenchendo lista ordenada com links
listaOrdenada.innerHTML = `
    <li><a href="https://google.com">Google</a></li>
    <li><a href="https://github.com">GitHub</a></li>
    <li><a href="https://developer.mozilla.org">MDN Web Docs</a></li>
`
