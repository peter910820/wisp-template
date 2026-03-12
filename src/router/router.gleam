import gleam/io
import wisp.{type Request, type Response}

pub type Context {
  Context(secret: String)
}

pub fn handle_request(_: Request) -> Response {
  io.println("Successful✅")
  wisp.ok()
}
