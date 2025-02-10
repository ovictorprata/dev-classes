const deslocamento = 3;

// Função de descriptografia
function descriptografarTexto(texto) {
  let textoDescriptografado = "";
  for (let i = 0; i < texto.length; i++) {
    let char = texto[i];
    // Verifica se o caractere é uma letra
    if (char.match(/[a-zA-Z]/)) {
      // Obtém o código do caractere (em ASCII)
      let codigo = texto.charCodeAt(i);

      // Maiúsculas
      if (char >= "A" && char <= "Z") {
        char = String.fromCharCode(
          ((codigo - 65 - deslocamento + 26) % 26) + 65
        );
      }
      // Minúsculas
      else if (char >= "a" && char <= "z") {
        char = String.fromCharCode(
          ((codigo - 97 - deslocamento + 26) % 26) + 97
        );
      }
    }
    textoDescriptografado += char;
  }
  return textoDescriptografado;
}

const senhaCriptografada = "Z2UEY7MF";
const correctPassword = descriptografarTexto(senhaCriptografada);

let attemptCount = localStorage.getItem("attemptCount");

// Verifica se o valor recuperado é um número válido
if (attemptCount === null || isNaN(attemptCount)) {
  attemptCount = 0; // Define 0 caso não haja valor ou o valor seja inválido
} else {
  attemptCount = parseInt(attemptCount); // Caso contrário, converte para número
}

document.getElementById(
  "attemptCount"
).innerText = `Tentativas: ${attemptCount}`;

function moveFocus(input, index) {
  input.value = input.value.replace(/[^a-zA-Z0-9]/g, "");
  if (input.value && index < 7) {
    document.getElementsByClassName("input-box")[index + 1].focus();
  }
}

function handleBackspace(event, index) {
  if (event.key === "Backspace" && index > 0 && event.target.value === "") {
    document.getElementsByClassName("input-box")[index - 1].focus();
  }
}

function checkPassword() {
  const btnCheck = document.querySelector("#btnCheck");
  let inputs = document.getElementsByClassName("input-box");
  let inputValues = "";
  for (let i = 0; i < inputs.length; i++) {
    inputValues += inputs[i].value.toUpperCase();
  }

  if (inputValues.length !== 8) {
    alert("A senha deve ter 8 caracteres!");
    return;
  }

  attemptCount++; // Incrementa o contador de tentativas
  localStorage.setItem("attemptCount", attemptCount); // Salva no localStorage

  document.getElementById(
    "attemptCount"
  ).innerText = `Tentativas: ${attemptCount}`; // Exibe no HTML

  for (let i = 0; i < 8; i++) {
    btnCheck.setAttribute("disabled", "");

    setTimeout(() => {
      inputs[i].style.transform = "rotateY(110deg)";
      setTimeout(() => {
        if (inputValues[i] === correctPassword[i]) {
          inputs[i].classList.add("green");
        } else {
          inputs[i].classList.add("red");
        }
        inputs[i].style.transform = "rotateY(0deg)";
      }, 250);
    }, i * 500);
  }

  setTimeout(() => {
    let message = document.querySelector(".buttons");
    if (inputValues === correctPassword) {
      message.innerHTML = `<h2>Parabéns! Você decifrou a senha e pegou o criminoso! </h2><h3>Sid, você está PRESO!</h3><img src="sid.png" />`;
    } else {
      document.querySelector("#tryAgain").style.display = "block";
      document.querySelector("#btnCheck").style.display = "none";
    }
  }, 4000);
}

function resetGame() {
  document.querySelector("#tryAgain").style.display = "none";
  const btnCheck = document.querySelector("#btnCheck");
  btnCheck.style.display = "block";
  btnCheck.removeAttribute("disabled");
  let inputs = document.getElementsByClassName("input-box");
  for (let input of inputs) {
    input.value = "";
    input.classList.remove("green", "red");
  }
  document.getElementById("message").innerHTML = "";

  // Não resetar o contador de tentativas
  // Apenas limpar os campos de entrada e o estado do jogo
  inputs[0].focus();
}

document.addEventListener("DOMContentLoaded", () => {
  const inputs = document.querySelectorAll(".input-box");
  inputs.forEach((input) => {
    input.addEventListener("keydown", (event) => {
      if (event.key === "Enter") {
        checkPassword();
      }
    });
  });

  // Exibe o número de tentativas carregado do localStorage ao iniciar
  document.getElementById(
    "attemptCount"
  ).innerText = `Tentativas: ${attemptCount}`;
});
