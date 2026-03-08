{
  description = "siraken's flake templates";

  outputs =
    { self, ... }:
    {
      templates = {
        node = {
          path = ./node;
          description = "Node.js development environment with corepack";
        };
        php = {
          path = ./php;
          description = "PHP development environment with composer";
        };
        ruby = {
          path = ./ruby;
          description = "Ruby development environment with bundler";
        };
        rust = {
          path = ./rust;
          description = "Rust development environment";
        };
        go = {
          path = ./go;
          description = "Go development environment";
        };
        python = {
          path = ./python;
          description = "Python development environment with uv";
        };
      };
    };
}
