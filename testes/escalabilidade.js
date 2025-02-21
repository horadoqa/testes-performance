import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 60 },
    { duration: '30s', target: 80 },
    { duration: '30s', target: 100 },
    { duration: '30s', target: 120 },
    { duration: '30s', target: 140 },
    { duration: '30s', target: 160 },
    { duration: '30s', target: 180 },
    { duration: '30s', target: 200 },
  ],
};

export default function () {
  const res = http.get('http://localhost/');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1);
}