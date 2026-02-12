import { Router } from "express";
import quartosController from "../controllers/quartosController";

const rotaConsultar = Router();

rotaConsultar.post("/", quartosController.disponiveis);

export default rotaConsultar;