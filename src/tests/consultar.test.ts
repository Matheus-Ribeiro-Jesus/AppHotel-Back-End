test("POST: /api/quartosDisponiveis = 200", async()=>{
    const resp = await fetch("https://app-hotel-back-end.vercel.app/api/quartosDisponiveis",{
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            dataInicio:"2026/02/12",
            dataFim:"2026/02/13",
            quantidade:3
        })
    });
    expect(resp.status).toBe(200);
    const json = await resp.json()
    console.log(json)
})