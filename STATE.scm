;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; STATE.scm — eclipse-ssg

(define metadata
  '((version . "0.2.0") (updated . "2025-12-17") (project . "eclipse-ssg")))

(define current-position
  '((phase . "v0.2 - Integration Complete")
    (overall-completion . 40)
    (components
      ((rsr-compliance ((status . "complete") (completion . 100)))
       (hub-integration ((status . "complete") (completion . 100)))
       (security-hardening ((status . "complete") (completion . 100)))
       (testing ((status . "not-started") (completion . 0)))
       (documentation ((status . "in-progress") (completion . 50)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())
    (resolved
      (("SECURITY.md placeholders" . "2025-12-17")
       ("SCM file naming" . "2025-12-17")))))

(define critical-next-actions
  '((immediate
      (("Add adapter tests" . high)
       ("Create deno.json config" . medium)))
    (this-week
      (("Add README with usage examples" . medium)
       ("Set up CI for adapter validation" . medium)))))

(define roadmap
  '((v0.1 (name . "Initial Setup")
          (status . "complete")
          (items . ("RSR compliance" "Repository structure" "CI/CD setup")))
    (v0.2 (name . "Hub Integration")
          (status . "complete")
          (items . ("Sync 28 SSG adapters from poly-ssg-mcp"
                    "Security policy configuration"
                    "SCM metadata updates")))
    (v0.3 (name . "Testing & Validation")
          (status . "planned")
          (items . ("Unit tests for adapter loading"
                    "Integration tests with mock SSGs"
                    "CI pipeline for adapter validation"
                    "Coverage reporting")))
    (v0.4 (name . "Documentation & Examples")
          (status . "planned")
          (items . ("README with quick start guide"
                    "Usage examples for each adapter"
                    "API documentation"
                    "Troubleshooting guide")))
    (v0.5 (name . "Production Readiness")
          (status . "planned")
          (items . ("Input validation for all adapters"
                    "Error handling improvements"
                    "Performance benchmarks"
                    "Release automation")))
    (v1.0 (name . "Stable Release")
          (status . "planned")
          (items . ("Full test coverage (70%+)"
                    "Complete documentation"
                    "npm/deno package publishing"
                    "Security audit")))))

(define session-history
  '((snapshots
      ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
      ((date . "2025-12-17") (session . "hub-integration") (notes . "28 SSG adapters synced from poly-ssg-mcp"))
      ((date . "2025-12-17") (session . "security-review") (notes . "Fixed SECURITY.md, updated SCM files")))))

(define state-summary
  '((project . "eclipse-ssg")
    (completion . 40)
    (blockers . 0)
    (adapters . 28)
    (updated . "2025-12-17")))
