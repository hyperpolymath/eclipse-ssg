;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — eclipse-ssg

(ecosystem
  (version "1.0.0")
  (name "eclipse-ssg")
  (type "satellite")
  (purpose "Satellite SSG implementation providing MCP protocol interface to 28+ static site generators")

  (position-in-ecosystem
    "Satellite implementation in the hyperpolymath ecosystem. Synchronizes adapters from poly-ssg-mcp hub.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Central hub with all SSG adapters via MCP
         eclipse-ssg = Satellite implementation consuming the hub adapters"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "RSR compliance guidelines and templates")))

  (what-this-is
    "A satellite SSG project that:
     - Integrates 28 static site generator adapters from poly-ssg-mcp
     - Provides unified CLI interface via MCP protocol
     - Supports Rust, Haskell, Elixir, Julia, OCaml, Scheme, and more")

  (what-this-is-not
    "- NOT the canonical source for SSG adapters (that's poly-ssg-mcp)
     - NOT a standalone SSG implementation
     - NOT exempt from RSR compliance"))
