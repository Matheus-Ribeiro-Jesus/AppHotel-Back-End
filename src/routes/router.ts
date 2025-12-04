import { Router } from "express";
import rotaTarefa from "./tarefaRoute";
import { createJWT } from "../utils/jwt"

const handlerRouter = Router();
handlerRouter.use("/tarefas", rotaTarefa);


handlerRouter.use("/jwt", (req, res) => {
  res.json(createJWT())
})

export default handlerRouter;
