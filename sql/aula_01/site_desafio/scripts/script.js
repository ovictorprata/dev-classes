const deslocamento = 3;
let bloqueado = false;
let bloqueioTimeout;
const TEMPO_BLOQUEIO = 60 * 60 * 1000;

function descriptografarTexto(texto) {
  const mapaDescriptografar = {
    4: "1",
    5: "2",
    6: "3",
    7: "4",
    8: "5",
    9: "6",
    0: "7",
    1: "8",
    2: "9",
    3: "0",
  };

  let textoDescriptografado = "";
  for (let i = 0; i < texto.length; i++) {
    let char = texto[i];

    // Verifica se é número e aplica o mapeamento reverso
    if (char >= "0" && char <= "9") {
      char = mapaDescriptografar[char] || char;
    }
    // Descriptografar letras (com deslocamento)
    else if (char.match(/[a-zA-Z]/)) {
      let codigo = texto.charCodeAt(i);

      if (char >= "A" && char <= "Z") {
        char = String.fromCharCode(((codigo - 65 - 3 + 26) % 26) + 65); // Deslocamento reverso para maiúsculas
      } else if (char >= "a" && char <= "z") {
        char = String.fromCharCode(((codigo - 97 - 3 + 26) % 26) + 97); // Deslocamento reverso para minúsculas
      }
    }

    textoDescriptografado += char;
  }
  return textoDescriptografado;
}

function criptografarTexto(texto) {
  const mapaCriptografar = {
    1: "4",
    2: "5",
    3: "6",
    4: "7",
    5: "8",
    6: "9",
    7: "0",
    8: "1",
    9: "2",
    0: "3",
  };

  let textoCriptografado = "";
  for (let i = 0; i < texto.length; i++) {
    let char = texto[i];

    // Verifica se é número e aplica o mapeamento
    if (char >= "0" && char <= "9") {
      char = mapaCriptografar[char] || char;
    }
    // Criptografar letras (com deslocamento)
    else if (char.match(/[a-zA-Z]/)) {
      let codigo = texto.charCodeAt(i);

      if (char >= "A" && char <= "Z") {
        char = String.fromCharCode(((codigo - 65 + 3) % 26) + 65); // Exemplo de deslocamento de 3 para maiúsculas
      } else if (char >= "a" && char <= "z") {
        char = String.fromCharCode(((codigo - 97 + 3) % 26) + 97); // Exemplo de deslocamento de 3 para minúsculas
      }
    }

    textoCriptografado += char;
  }
  return textoCriptografado;
}

const textoOriginal = "W2RBV7JC";
const senhaCriptografada = criptografarTexto(textoOriginal, deslocamento);
const senhaDescriptografada = descriptografarTexto(senhaCriptografada);
console.log(senhaCriptografada, senhaDescriptografada); // W2RBV7JC

let attemptCount = localStorage.getItem("attemptCount");

if (attemptCount === null || isNaN(attemptCount)) {
  attemptCount = 0;
} else {
  attemptCount = parseInt(attemptCount);
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

function bloquearBotao() {
  const btnCheck = document.querySelector("#btnCheck");
  let contador = 3;
  btnCheck.setAttribute("disabled", "");

  const intervalo = setInterval(() => {
    if (contador <= 0) {
      clearInterval(intervalo);
      btnCheck.removeAttribute("disabled");
      document.querySelector("#btnCheck").innerText = "Verificar";
      bloqueado = false;
    } else {
      document.querySelector("#btnCheck").innerText = `Aguarde ${contador}s`;
      contador--;
    }
  }, 1000);
}

function checkPassword() {
  if (bloqueado) return;

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

  // Verificar se há 3 ou mais caracteres iguais
  let charCount = {};
  for (let i = 0; i < inputValues.length; i++) {
    let char = inputValues[i];
    charCount[char] = (charCount[char] || 0) + 1;
  }

  // Se houver 3 ou mais caracteres iguais, bloqueia o usuário
  for (let char in charCount) {
    if (charCount[char] >= 3) {
      alert(
        "Tá tentando acertar a senha no chute? Deixa de preguiça e vá estudar!"
      );
      return;
    }
  }

  attemptCount++;
  localStorage.setItem("attemptCount", attemptCount);

  document.getElementById(
    "attemptCount"
  ).innerText = `Tentativas: ${attemptCount}`;

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
      message.innerHTML = `<h2>Parabéns! Você decifrou a senha e pegou o criminoso! </h2><h3>Sid, você está PRESO!</h3><img src="assets/sid.png" />`;
    } else {
      document.querySelector("#tryAgain").style.display = "block";
      document.querySelector("#btnCheck").style.display = "none";

      if (attemptCount >= 3) {
        bloqueado = true;
        bloquearBotao();
      }
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

  document.getElementById(
    "attemptCount"
  ).innerText = `Tentativas: ${attemptCount}`;
});
