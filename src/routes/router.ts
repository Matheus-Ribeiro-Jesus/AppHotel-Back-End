import { Router } from "express";
import { middleware } from "./jwtMiddleware";
import rotaLogin from "./loginRouter";
import rotaReservas from "./reservaRouter";

import rotaConsultar from "./quartosRouter";


const handlerRouter = Router();

handlerRouter.use("/api/login", rotaLogin);

handlerRouter.use("/api/quartosDisponiveis", rotaConsultar);
handlerRouter.use("/api/reserva", middleware, rotaReservas);



export default handlerRouter;
