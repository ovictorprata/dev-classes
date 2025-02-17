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

    if (char >= "0" && char <= "9") {
      char = mapaDescriptografar[char] || char;
    } else if (char.match(/[a-zA-Z]/)) {
      let codigo = texto.charCodeAt(i);

      if (char >= "A" && char <= "Z") {
        char = String.fromCharCode(((codigo - 65 - 3 + 26) % 26) + 65);
      } else if (char >= "a" && char <= "z") {
        char = String.fromCharCode(((codigo - 97 - 3 + 26) % 26) + 97);
      }
    }

    textoDescriptografado += char;
  }
  return textoDescriptografado;
}

const textoOriginal = "6K258IY3";
const senhaDescriptografada = descriptografarTexto(textoOriginal);

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
  let contador = 180;
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

  let charCount = {};
  for (let i = 0; i < inputValues.length; i++) {
    let char = inputValues[i];
    charCount[char] = (charCount[char] || 0) + 1;
  }

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
        if (inputValues[i] === senhaDescriptografada[i]) {
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
    if (inputValues === senhaDescriptografada) {
      message.innerHTML = `<h2>Parabéns! Você decifrou a senha, mas o criminoso foi mais rápido que você :(</h2>
      <img
        src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c86d0346-0010-479a-a177-7b3e87007f5e/d8keqfo-650a6ac1-3335-457f-bba0-ef8a46493e19.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2M4NmQwMzQ2LTAwMTAtNDc5YS1hMTc3LTdiM2U4NzAwN2Y1ZVwvZDhrZXFmby02NTBhNmFjMS0zMzM1LTQ1N2YtYmJhMC1lZjhhNDY0OTNlMTkuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.mUsj011uOCK-6Pghkyq946aJ5yPPvDiqHJxG6SqBUnw"
        alt=""
      />
      <p>Os rastros dele estão <a href="https://docs.google.com/document/d/1tQb3cmPCXSd4c54kV0rQ8r8BHUIqarnitXjIuJ48MZQ/edit?tab=t.1suqompqhg7u">aqui</a>.<p>`;
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
