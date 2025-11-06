import express from "express";
import { Request, Response, NextFunction } from "express";
import router from "./routes/tarefaRoute";

const app = express();
app.use(express.json());
app.use("/tarefas", router);


export default app;
