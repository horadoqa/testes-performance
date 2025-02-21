import http from 'k6/http';
import { check, sleep } from 'k6';
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";
import { textSummary } from "https://jslib.k6.io/k6-summary/0.0.1/index.js";

export const options = {
  stages: [
    { duration: '60s', target: 70 },
    { duration: '4m', target: 70 },
    { duration: '30s', target: 0 },
  ],
};

export function handleSummary(data) {
  return {
    "summary.html": htmlReport(data),
    // Mostrar o resultado tanto na linha de comando quanto no summary.html
    stdout: textSummary(data, { indent: " ", enableColors: true }),
  };
}

export default function () {
  const res = http.get('http://localhost/');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1);
}