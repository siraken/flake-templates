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
      };
    };
}
