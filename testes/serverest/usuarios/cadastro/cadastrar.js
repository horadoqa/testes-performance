import http from 'k6/http';
import { check } from 'k6';
import { readFile } from 'k6/fs';  // Importa a função de leitura de arquivo

// Lê o arquivo JSON com os dados dos usuários
const users = JSON.parse(readFile('./usuarios.json'));  // Supondo que o arquivo esteja no mesmo diretório

// URL da API para o cadastro de usuário
const url = 'https://<IP>/usuarios';

// Cabeçalhos da requisição
const headers = {
  'accept': 'application/json',
  'Content-Type': 'application/json'
};

export default function () {
  // Itera sobre a lista de usuários e realiza o cadastro para cada um
  for (let user of users) {
    // Cria o payload (dados do usuário) para o cadastro
    const payload = JSON.stringify({
      nome: user.nome,
      email: user.email,
      password: user.password,
      administrador: user.administrador
    });

    // Envia a requisição POST para cadastrar o usuário
    let res = http.post(url, payload, { headers: headers });

    // Verifica se o status da resposta é 201 (Created)
    check(res, {
      'status é 201': (r) => r.status === 201,
      'resposta contém um JSON': (r) => r.headers['Content-Type'] === 'application/json',
      'usuário foi criado com sucesso': (r) => r.body.includes('Cadastro realizado com sucesso'),
    });

    // Opcional: imprime a resposta para depuração
    console.log(`Usuário cadastrado: ${user.nome}`);
    console.log('Resposta:', res.body);
  }
}
