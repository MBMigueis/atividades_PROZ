let elementoH1 = document.querySelector("H1");

elementoH1.innerText = "Novo título com JS";

console.log(elementoH1);
console.log(elementoH1.innerText);

let elementoMain = document.querySelector("main");

elementoMain.innerHTML = ` 
<h2>Novo subtítulo</h2>;
<ul>
    <li>Elemento de lista JS 01</li>
    <li>Elemento de lista JS 02</li>
    <li>Elemento de lista JS 03</li>
</ul>
`;

// console.log(elementMain);
// console.log(elementMain.innerText);
// console.log(elementMain.innerHTML);
 