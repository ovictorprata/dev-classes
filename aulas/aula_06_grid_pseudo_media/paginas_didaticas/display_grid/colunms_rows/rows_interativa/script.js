const columnsInput = document.getElementById("columns");
const rowsInput = document.getElementById("rows");
const gridContainer = document.getElementById("grid-container");
const cssCodeElement = document.getElementById("css-code");
const htmlCodeElement = document.getElementById("html-code");

function updateGrid() {
  const columnsValue = columnsInput.value;
  const rowsValue = rowsInput.value;
  gridContainer.style.gridTemplateColumns = columnsValue;
  gridContainer.style.gridTemplateRows = rowsValue;
  updateCodeDisplay(columnsValue, rowsValue);
}

function updateCodeDisplay(columnsValue, rowsValue) {
  const cssCode = `.grid-container {\n  display: grid;\n  gap: 10px;\n  grid-template-columns: ${columnsValue};\n  grid-template-rows: ${rowsValue};\n}`;
  const htmlCode = document.querySelector(".container").outerHTML;
  cssCodeElement.textContent = cssCode;
  htmlCodeElement.textContent = htmlCode;
}

columnsInput.addEventListener("input", updateGrid);
rowsInput.addEventListener("input", updateGrid);
updateGrid();
