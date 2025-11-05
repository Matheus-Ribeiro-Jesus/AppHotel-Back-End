import app from "./app";
import { Request, Response, NextFunction } from "express";
const PORT = 3000;

// rota generica
app.use((req: Request, res: Response, next: NextFunction) => {
  res.send("Hello World!");
});

// rota de erro
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err);
  res.status(500).send("Erro na requisição");

});

app.listen(PORT, () => console.log(`Servidor está rodando na PORTA: ${PORT}`));
