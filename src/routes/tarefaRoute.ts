import { Router } from "express";
import tarefasController from "../controllers/tarefasController";

const rotaTarefa = Router();

rotaTarefa.get("/", tarefasController.pegarTarefas);
rotaTarefa.get("/:id", tarefasController.pegarTarefa);
rotaTarefa.post("/", tarefasController.criarTarefa);
rotaTarefa.put("/:id", tarefasController.atualizarTarefa);
rotaTarefa.delete("/:id", tarefasController.deletarTarefa);

export default rotaTarefa;
