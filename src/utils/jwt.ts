import jwt from "jsonwebtoken";

const JWT_SECRET = "senha_super_secreta";
const DURATION = 60 * 60 * 24

export function createJWT(){
  const payload = {
    id: 123,
    nome: "matheus",
    cargo: "cliente",
  }
  return jwt.sign(payload, JWT_SECRET, {
    expiresIn: DURATION,
    algorithm: "HS256"
  })
}
