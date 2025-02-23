import http from 'k6/http';
import { check } from 'k6';

// URL da API para excluir o usuário com ID '0uxuPY0cbmQhpEz1'
const url = 'https://<ID>/usuarios/0uxuPY0cbmQhpEz1';

// Cabeçalhos da requisição
const headers = {
  'accept': 'application/json'
};

export default function () {
  // Envia a requisição DELETE
  let res = http.del(url, null, { headers: headers });

  // Verifica se o status da resposta é 200 (OK), indicando que a exclusão foi bem-sucedida
  check(res, {
    'status é 200': (r) => r.status === 200,
    'resposta contém um JSON': (r) => r.headers['Content-Type'] === 'application/json',
  });

  // Opcional: imprime a resposta para depuração
  console.log('Resposta:', res.body);
}
