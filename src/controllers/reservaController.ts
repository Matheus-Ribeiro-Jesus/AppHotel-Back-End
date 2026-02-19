import { Request, Response, NextFunction } from "express";
import reservaRepository from "../repositories/reservaRepository";

async function corrigirDataHora(data:string, hora:number){
    let novaData = new Date(data);
    novaData.setHours(hora, 0, 0)
    return novaData;
}

async function criarPedido(req: Request, res:Response, next:NextFunction){
    const token = req.payload;
    const { pagamento, quartos } = req.body
    
    if(!token.id || !pagamento || !quartos){
        return res.status(400).json({erro: "Dados incompletos"});
    }
    try {
        const dadosPedido = {
            cliente_id: token.id,
            pagamento: pagamento,

        }
        const pedidoID = await reservaRepository.fazerPedido(dadosPedido)
        if(!pedidoID){ throw new Error("Erro ao criar pedido")};
        let result = []
        for (let q of quartos) {
            q.dataInicio = corrigirDataHora(q.dataInicio, 14);
            q.dataFim = corrigirDataHora(q.dataFim, 12);
            const reservaID = await reservaRepository.fazerReserva(pedidoID, q);
            if(!reservaID){continue};
            result.push({
                ...q,
                reservaID: reservaID
            })
        }
        console.log(result);
        res.status(200).json({
            message: "Reserva feita com sucesso",
            pedidoID: pedidoID,
            reservas: result,
        })

    } catch (error) {
        console.log(error)
        return res.status(400).json({erro: "Reserva não efetuada!"});

    }
}


export default {
    criarPedido
}