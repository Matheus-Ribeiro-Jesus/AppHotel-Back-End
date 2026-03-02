test("POST /cadastro → deve retornar 201 e um token JWT", async () => {
  const payload = {
    nome: "Matheus Qs",
    cpf: "2322'",
    email: "testes@13teste.com",
    senha: "232",
    telefone: "12332"
  };

  const res = await fetch("http://localhost:3000/api/login/cadastro", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });

  expect(res.status).toBe(201);
});