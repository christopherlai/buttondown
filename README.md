# Buttondown
Buttondown API for Elixir.

## Installation
The package can be installed by adding `buttondown` to your list of dependencies in `mix.exs` with your preferred JSON library.

```elixir
def deps do
  [
    {:buttondown, "~> 0.1.0"},
    {:jason, "~> 1.0"}
  ]
end
```

## Configuration
Your Buttondown API Token and JSON library can be configured in your project configuration (`config.exs` or similar configuration file).

`Jason` is the default JSON library and does not need to be included in your config. Any other JSON library will need to be added to your project `deps` and configured.

```elixir
config :buttondown,
  api_token: "your-token",
  json_library: Posion
```

## License
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
