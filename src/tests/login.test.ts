const URL_base = "http://localhost:3000/api/login";

test("POST: /login = 200", async () => {
  const res = await fetch(URL_base, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      email: "matheus@gmail.com",
      senha: "123"
    }),
  });

  const text = await res.text();  
  expect(res.status).toBe(200);
});