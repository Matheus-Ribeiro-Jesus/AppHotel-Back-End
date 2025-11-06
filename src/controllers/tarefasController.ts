import { Request, Response, NextFunction } from "express";

function pegarTarefas(req: Request, res: Response, next: NextFunction) {
  res.send("listar todas as tarefas");
}

function pegarTarefa(req: Request, res: Response, next: NextFunction) {
  res.send("listar uma tarefa");
}

function criarTarefa(req: Request, res: Response, next: NextFunction) {
  res.send("criar uma tarefa");
}

function atualizarTarefa(req: Request, res: Response, next: NextFunction) {
  res.send("atualizar uma tarefa");
}

function deletarTarefa(req: Request, res: Response, next: NextFunction) {
  res.send("deletar uma tarefa");
}

export default {
  pegarTarefas,
  pegarTarefa,
  criarTarefa,
  atualizarTarefa,
  deletarTarefa,
};
