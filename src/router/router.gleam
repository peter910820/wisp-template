import gleam/http
import gleam/io
import wisp.{type Request, type Response}

pub type Context {
  Context(secret: String)
}

pub fn handle_request(req: Request) -> Response {
  let segments = wisp.path_segments(req)
  case req.method, segments {
    // index route
    http.Get, [] -> {
      let return_string = "Successful✅"
      io.println(return_string)
      wisp.ok()
      |> wisp.set_header("content-type", "text/html; charset=utf-8")
      |> wisp.string_body(return_string)
    }
    // dynamic route
    http.Get, ["user", user_id] -> {
      let return_string = "Hello " <> user_id <> "😀"
      io.println(return_string)
      wisp.ok()
      |> wisp.set_header("content-type", "text/html; charset=utf-8")
      |> wisp.string_body(return_string)
    }
    _, _ -> wisp.not_found()
  }
}
