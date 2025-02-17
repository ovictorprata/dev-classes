// Selecionando os inputs, a grid e os elementos para exibir o código
const columnsInput = document.getElementById("columns");
const rowsInput = document.getElementById("rows");
const gridContainer = document.getElementById("grid-container");
const cssCodeElement = document.getElementById("css-code");
const htmlCodeElement = document.getElementById("html-code");

// Função para atualizar a grid com os valores inseridos
function updateGrid() {
  const columnsValue = columnsInput.value;
  const rowsValue = rowsInput.value;

  gridContainer.style.gridTemplateColumns = columnsValue;
  gridContainer.style.gridTemplateRows = rowsValue;

  // Atualizando o código CSS e HTML exibido
  updateCodeDisplay(columnsValue, rowsValue);
}

// Função para atualizar o código CSS e HTML exibido
function updateCodeDisplay(columnsValue, rowsValue) {
  const cssCode = `
.grid-container {
  display: grid;
  gap: 10px;
  grid-template-columns: ${columnsValue};
  grid-template-rows: ${rowsValue};
  width: 600px;
  height: 500px;
  background-color: #fff;
}
  `;

  const htmlCode = `
<div class="grid-container" id="grid-container">
  <div class="grid-item">1</div>
  <div class="grid-item">2</div>
  <div class="grid-item">3</div>
  <div class="grid-item">4</div>
  <div class="grid-item">5</div>
  <div class="grid-item">6</div>
  <div class="grid-item">7</div>
  <div class="grid-item">8</div>
  <div class="grid-item">9</div>
  <div class="grid-item">10</div>
  <div class="grid-item">11</div>
  <div class="grid-item">12</div>
</div>
  `;

  // Atualizando o conteúdo
  cssCodeElement.textContent = cssCode;
  htmlCodeElement.textContent = htmlCode;

  // Destacar o valor alterado (1fr 1fr ou outro) com animação
  highlightCode(cssCodeElement);
}

function highlightCode(element) {
  // Destacando qualquer valor após grid-template-columns ou grid-template-rows
  const cssLines = element.textContent.split("\n");

  const updatedLines = cssLines
    .map((line) => {
      // Destacar os valores após grid-template-columns ou grid-template-rows
      if (
        line.includes("grid-template-columns") ||
        line.includes("grid-template-rows")
      ) {
        return line.replace(
          /(:\s*)([^;]+)/g, // Captura o valor após ":" até o ponto e vírgula
          (match, p1, p2) => {
            return `${p1}<span class="highlight">${p2}</span>`;
          }
        );
      }
      return line;
    })
    .join("\n");

  element.innerHTML = updatedLines; // Atualiza o código com a marcação de destaque
}

// Adicionando eventos de input para atualizar a grid
columnsInput.addEventListener("input", updateGrid);
rowsInput.addEventListener("input", updateGrid);

// Inicializando a grid ao carregar a página
updateGrid();
