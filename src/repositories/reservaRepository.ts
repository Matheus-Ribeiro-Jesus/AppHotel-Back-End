import { pool } from "../database/database";
import { ResultSetHeader, RowDataPacket } from "mysql2";

async function fazerPedido(data:any) {
    const sql = `INSERT INTO pedidos(cliente_id, pagamento) VALUES(?, ?)`;

    try {
        const [result] = await pool.query<ResultSetHeader>(sql, [
            data.cliente_id,
            data.pagamento
        ]);
        return result.insertId;
    } catch (error) {
        console.error("Erro ao criar pedido: ", error);
        return null;

    }
}

async function fazerReserva(idPedido: number, quarto: any) {
    const sql = `INSERT INTO reservas (pedido_id, quarto_id, inicio, fim) VALUES (?, ?, ?, ?)`;

    try {
        const [result] = await pool.query<ResultSetHeader>(sql, [
            idPedido,
            quarto.id,
            quarto.dataInicio,
            quarto.dataFim,
        ]);
        return result.insertId;
    } catch (error) {
        console.log('Erro ao reservar o quarto', error)
        return null;

    }
}



export default {
    fazerPedido, fazerReserva
}