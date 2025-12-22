;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; PLAYBOOK.scm — eclipse-ssg operational playbook

(define-module (eclipse-ssg playbook)
  #:export (commands workflows recipes hooks))

;;;; ============================================================
;;;; PLAYBOOK — Operational runbooks for eclipse-ssg
;;;; ============================================================

(define commands
  '((build
      (just . "just build")
      (must . "must build")
      (deno . "deno task build")
      (description . "Build the SSG engine and adapters"))
    (test
      (just . "just test")
      (must . "must test")
      (deno . "deno task test")
      (description . "Run unit tests"))
    (test-e2e
      (just . "just test-e2e")
      (must . "must test-e2e")
      (description . "Run end-to-end integration tests"))
    (lsp
      (just . "just lsp")
      (description . "Start the NoteG language server"))
    (compile
      (just . "just compile <file>")
      (description . "Compile a .noteg file"))
    (test-all
      (just . "just test-all")
      (description . "Run all tests (unit + e2e + verification)"))
    (fmt
      (just . "just fmt")
      (deno . "deno fmt")
      (description . "Format all source files"))
    (lint
      (just . "just lint")
      (deno . "deno lint")
      (description . "Lint all source files"))
    (check
      (just . "just check")
      (description . "Run all checks (fmt + lint + typecheck)"))
    (serve
      (just . "just serve")
      (description . "Start development server"))
    (clean
      (just . "just clean")
      (description . "Clean build artifacts"))
    (deps
      (just . "just deps")
      (description . "Install/update dependencies"))))

(define workflows
  '((development
      (steps . ("deps" "check" "test" "build"))
      (hooks . ("pre-commit" "pre-push"))
      (description . "Standard development workflow"))
    (release
      (steps . ("check" "test-all" "build" "package" "publish"))
      (hooks . ("pre-release" "post-release"))
      (description . "Release preparation and publishing"))
    (ci
      (steps . ("deps" "check" "test-all" "build" "coverage"))
      (description . "Continuous integration pipeline"))
    (security-scan
      (steps . ("codeql" "dependency-check" "secret-scan"))
      (description . "Security scanning workflow"))))

(define recipes
  '((nickel
      (build . "nickel eval build.ncl")
      (config . "nickel export config.ncl --format json")
      (validate . "nickel typecheck *.ncl"))
    (cli-combinatorics
      (adapters . "for a in adapters/*.js; do deno run $a --version; done")
      (parallel-build . "parallel just build-adapter ::: zola hakyll cobalt")
      (matrix . "just test --adapter={zola,hakyll,cobalt} --format={html,json}"))
    (hooks
      (session-start . "Run on new session initialization")
      (pre-commit . "Lint, format, typecheck before commit")
      (pre-push . "Run tests before push")
      (post-checkout . "Sync adapters after checkout")
      (notification . "Send notifications via configured channels"))))

(define hooks
  '((session-start-hook
      (trigger . "session.start")
      (actions . ("verify-deps" "sync-adapters" "check-env"))
      (timeout . 30))
    (pre-commit-hook
      (trigger . "git.pre-commit")
      (actions . ("fmt --check" "lint" "typecheck"))
      (block-on-failure . #t))
    (pre-push-hook
      (trigger . "git.pre-push")
      (actions . ("test" "build"))
      (block-on-failure . #t))
    (adapter-sync-hook
      (trigger . "manual")
      (actions . ("sync-from-hub" "validate-adapters" "update-registry"))
      (description . "Sync adapters from poly-ssg-mcp hub"))
    (notification-hook
      (trigger . "ci.complete")
      (channels . ("github" "discord" "email"))
      (on-success . #t)
      (on-failure . #t))))
