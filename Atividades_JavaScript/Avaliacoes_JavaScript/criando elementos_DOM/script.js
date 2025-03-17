// ===== Criação do Título =====
let titulo = document.createElement("h1")
titulo.id = "titulo"
titulo.innerText = "Loja de Eletrônicos"

// Captura o body
let body = document.querySelector("body")
body.appendChild(titulo)

// ===== Criação do Produto =====
let produto = document.createElement("div")
produto.innerHTML = `
  <div class="card-produto">
    <h2>Smartphone X2000</h2>
    <img src="smartphone.jpg" 
         alt="Smartphone com câmera tripla e tela infinita">
    <p>Tela AMOLED 6.8'', processador Snapdragon 8 Gen 2, 256GB de armazenamento e câmera tripla de 108MP.</p>
    <p id="preco-smartphone">R$ 1.599,99</p>
  </div>
`

body.appendChild(produto)
