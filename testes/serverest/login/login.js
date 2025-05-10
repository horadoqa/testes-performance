import http from 'k6/http';
import { check } from 'k6';

export const options = {
  stages: [
    { duration: '60s', target: 70 },
    { duration: '1m', target: 70 },
    { duration: '30s', target: 0 },
  ],
};

// URL da API
const url = 'http://<IP>/login';

// Dados que serão enviados no corpo da requisição
const payload = JSON.stringify({
  email: 'admin@horadoqa.com.br',
  password: '1q2w3e4r'
});

// Cabeçalhos da requisição
const headers = {
  'accept': 'application/json',
  'Content-Type': 'application/json'
};

export default function () {
  // Envia a requisição POST
  let res = http.post(url, payload, { headers: headers });

  // Verifica o status da resposta
  check(res, {
    'status é 200': (r) => r.status === 200,
    // 'resposta contém um JSON': (r) => r.headers['Content-Type'] === 'application/json',
  });

  // Opcional: imprime a resposta para depuração
  console.log('Resposta:', res.body);
}
