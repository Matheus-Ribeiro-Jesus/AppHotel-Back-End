test("POST /cadastro → deve retornar 201 e um token JWT", async () => {
  const payload = {
    nome: "Matheus Qerer",
    cpf: "23223232323233333333",
    email: "testes@132teste.com",
    senha: "12345678",
    telefone: "123212323323232"
  };

  const res = await fetch("http://localhost:3000/api/login/cadastro", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });

  expect(res.status).toBe(201);
});