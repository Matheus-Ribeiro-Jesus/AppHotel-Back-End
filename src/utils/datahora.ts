export async function corrigirDataHora(data: string, hora: number): Promise<string> {
    let dataObj: Date;

    try {
        // Tenta parsear como DD/MM/YYYY
        const [dia, mes, ano] = data.split('/').map(Number);
        if ([dia, mes, ano].some(isNaN) || ano < 1900 || mes < 1 || mes > 12 || dia < 1 || dia > 31) {
            throw new Error("Data inválida");
        }
        dataObj = new Date(ano, mes - 1, dia, hora, 0, 0);
    } catch {
        // Se falhar, tenta tratar como ISO ou outro formato
        dataObj = new Date(data);
        if (isNaN(dataObj.getTime())) {
            throw new Error(`Não foi possível interpretar a data: "${data}"`);
        }
        dataObj.setHours(hora, 0, 0, 0);
    }

    // Formata exatamente como o MySQL espera
    const yyyy = dataObj.getFullYear();
    const mm = String(dataObj.getMonth() + 1).padStart(2, '0');
    const dd = String(dataObj.getDate()).padStart(2, '0');
    const hh = String(dataObj.getHours()).padStart(2, '0');

    return `${yyyy}-${mm}-${dd} ${hh}:00:00`;
}