import { pool } from "../database/database";
import { RowDataPacket } from "mysql2";
import { QuartoReserva, Quartos } from "../models/quartosModel";

async function disponiveis(pedido: QuartoReserva): Promise<Quartos[] | null> {
  const sql = `
    SELECT q.*
    FROM quartos q
    LEFT JOIN reservas r 
      ON q.id = r.quarto_id
      AND r.fim >= ?             -- reserva termina depois ou no início da busca
      AND r.inicio <= ?           -- reserva começa antes ou no fim da busca
    WHERE q.disponivel = 1
      AND (q.qtd_cama_casal * 2 + q.qtd_cama_solteiro) >= ?
      AND r.quarto_id IS NULL           -- sem conflito de reserva no período
  `;

  const params = [
    pedido.dataInicio,   
    pedido.dataFim,     
    pedido.quantidade
  ];

  try {
    const [quartos] = await pool.query<Quartos[]>(sql, params);

    console.log(`[DEBUG] Parâmetros enviados:`, params);
    console.log(`[DEBUG] Query executada:`, sql);
    console.log(`[DEBUG] Quartos encontrados: ${quartos.length}`, quartos);

    return quartos.length ? quartos : null;
  } catch (err) {
    console.error("[ERRO] Falha na consulta de quartos disponíveis:", err);
    throw new Error("Erro interno ao consultar quartos");
  }
}

async function buscarFotoPorQuartoId(id: number): Promise<string[]> {
    const sql = `
        SELECT i.nome AS foto_nome
        FROM upimages ui
        INNER JOIN imagens i ON ui.image_id = i.id
        WHERE ui.quarto_id = ?
    `;

    const [rows] = await pool.query<RowDataPacket[]>(sql, [id]);
    
    return rows.map((row: RowDataPacket) => row.foto_nome as string);
}

export default {
    disponiveis, buscarFotoPorQuartoId
}