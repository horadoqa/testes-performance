import http from 'k6/http';
import { check } from 'k6';

// URL da API para atualizar o usuário com o ID '0uxuPY0cbmQhpEz1'
const url = 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1';

// Cabeçalhos da requisição
const headers = {
  'accept': 'application/json',
  'Content-Type': 'application/json'
};

// Dados a serem atualizados
const payload = JSON.stringify({
  nome: "Fulano da Silva",
  email: "beltrano@qa.com.br",
  password: "teste",
  administrador: "true"
});

export default function () {
  // Envia a requisição PUT para atualizar o usuário
  let res = http.put(url, payload, { headers: headers });

  // Verifica se o status da resposta é 200 (OK), indicando que a atualização foi bem-sucedida
  check(res, {
    'status é 200': (r) => r.status === 200,
    'resposta contém um JSON': (r) => r.headers['Content-Type'] === 'application/json',
    'usuário atualizado com sucesso': (r) => r.body.includes('Usuário atualizado com sucesso'),
  });

  // Opcional: imprime a resposta para depuração
  console.log('Resposta:', res.body);
}
