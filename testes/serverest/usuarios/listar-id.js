import http from 'k6/http';
import { check } from 'k6';

// URL da API para obter os dados de um usuário específico
const url = 'https://<ID>/usuarios/0uxuPY0cbmQhpEz1';

// Cabeçalhos da requisição
const headers = {
  'accept': 'application/json'
};

export default function () {
  // Envia a requisição GET
  let res = http.get(url, { headers: headers });

  // Verifica se o status da resposta é 200 (OK)
  check(res, {
    'status é 200': (r) => r.status === 200,
    'resposta contém um JSON': (r) => r.headers['Content-Type'] === 'application/json',
  });

  // Opcional: imprime a resposta para depuração
  console.log('Resposta:', res.body);
}
