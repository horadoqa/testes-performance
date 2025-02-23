import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 1 },
  ],
};

export default function () {
  const res = http.get('http://localhost/');
  check(res, { 'status was 200': (r) => r.status == 200 });

  // Verificar se a resposta é JSON antes de tentar fazer o parse
  let responseData;
  try {
    responseData = res.json();  // Tenta fazer o parse como JSON
  } catch (error) {
    // Se ocorrer um erro, não é JSON, então capturamos o corpo da resposta como texto
    responseData = res.body;
  }

  // Logar a resposta no console, seja JSON ou texto
  console.log(JSON.stringify(responseData, null, 2));

  sleep(30);
}


// k6 run validacao.js > response.json