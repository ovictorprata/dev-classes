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

    if (char >= "0" && char <= "9") {
      char = mapaCriptografar[char] || char;
    } else if (char.match(/[a-zA-Z]/)) {
      let codigo = texto.charCodeAt(i);

      if (char >= "A" && char <= "Z") {
        char = String.fromCharCode(((codigo - 65 + 3) % 26) + 65);
      } else if (char >= "a" && char <= "z") {
        char = String.fromCharCode(((codigo - 97 + 3) % 26) + 97);
      }
    }

    textoCriptografado += char;
  }
  return textoCriptografado;
}

const senha = "W2RBV7JC";
const senhaCriptografada = criptografarTexto(senha);
console.log(senhaCriptografada);
