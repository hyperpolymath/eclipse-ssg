;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — eclipse-ssg

(define-module (eclipse-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Satellite SSG implementation in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))
    (adr-002
     (title . "MCP Hub Integration")
     (status . "accepted")
     (date . "2025-12-17")
     (context . "Need unified interface to multiple SSGs")
     (decision . "Integrate with poly-ssg-mcp hub for 28+ SSG adapters")
     (consequences . ("Deno/JS adapters" "CLI wrapper pattern" "Hub synchronization")))))

(define development-practices
  '((code-style (languages . ("javascript" "scheme")) (formatter . "deno fmt") (linter . "deno lint"))
    (security (sast . "CodeQL") (credentials . "env vars only") (input-validation . "required"))
    (testing (coverage-minimum . 70))
    (versioning (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability.")
    (why-mcp "MCP protocol provides standardized tool interface for AI agents.")
    (why-deno "Deno provides secure-by-default runtime with TypeScript support.")))
