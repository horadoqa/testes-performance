import http from 'k6/http';
import { check } from 'k6';

export const options = {
  stages: [
    { duration: '60s', target: 100 },
    { duration: '4m', target: 100 },
    { duration: '30s', target: 0 },
  ],
};

export default function () {
  const res = http.get('https://horadoqa.github.io/testes-performance/');
  check(res, { 'status was 200': (r) => r.status == 200 });
}