test("POST: /api/reserva → 200", async () => {
    //realizar login
    const URL_base = "http://localhost:3000/api/login";

    const res = await fetch(URL_base, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            email: "matheus@gmail.com",
            senha: "123"
        }),
    });
    expect(res.status).toBe(200);
    const token = await res.json();
    console.log(token)


    //realizar reserva
    const resp = await fetch("http://localhost:3000/api/reserva", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify({
            pagamento: "pix",
            quartos: [
                {
                    id: 1,
                    dataInicio: "19/02/2026",
                    dataFim: "20/02/2026",

                },

                {
                    id: 2,
                    dataInicio: "21/02/2026",
                    dataFim: "22/02/2026",

                }
            ]
        })
    });
    expect(resp.status).toBe(200);
    const json = await resp.json();
    console.log(json);

});