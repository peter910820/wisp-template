import dot_env as dot
import dot_env/env
import gleam/erlang/process
import mist
import router/router.{handle_request}
import wisp/wisp_mist

pub fn main() -> Nil {
  dot.new()
  |> dot.set_path(".env")
  |> dot.set_debug(False)
  |> dot.load

  let assert Ok(secret_key) = env.get_string("SECRET_KEY")

  let assert Ok(_) =
    wisp_mist.handler(handle_request, secret_key)
    |> mist.new
    |> mist.port(3000)
    |> mist.start

  process.sleep_forever()
}
