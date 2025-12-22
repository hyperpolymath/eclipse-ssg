;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; AGENTIC.scm — eclipse-ssg agentic capabilities

(define-module (eclipse-ssg agentic)
  #:export (mcp-interface agent-tools agent-workflows autonomous-actions))

;;;; ============================================================
;;;; AGENTIC — AI Agent Integration for eclipse-ssg
;;;; ============================================================

(define mcp-interface
  '((protocol . "Model Context Protocol")
    (version . "1.0.0")
    (transport . ("stdio" "http" "websocket"))
    (capabilities
      (tools . #t)
      (resources . #t)
      (prompts . #t)
      (sampling . #f))
    (servers
      (noteg-mcp
        (path . "noteg-mcp/")
        (description . "NoteG language server via MCP")
        (tools . ("noteg_compile" "noteg_lint" "noteg_format")))
      (ssg-adapter
        (path . "adapters/")
        (description . "28 SSG adapters via MCP")
        (tools . ("init" "build" "serve" "check" "deploy"))))))

(define agent-tools
  '((ssg-tools
      (zola_init (description . "Initialize new Zola site")
                 (input . ((path . string) (force . boolean)))
                 (output . ((success . boolean) (stdout . string))))
      (zola_build (description . "Build Zola site")
                  (input . ((path . string) (base-url . string) (drafts . boolean)))
                  (output . ((success . boolean) (stdout . string))))
      (zola_serve (description . "Start Zola dev server")
                  (input . ((path . string) (port . number)))
                  (output . ((success . boolean) (url . string)))))
    (noteg-tools
      (noteg_compile (description . "Compile .noteg source")
                     (input . ((source . string)))
                     (output . ((ast . object) (errors . array))))
      (noteg_lint (description . "Lint NoteG source")
                  (input . ((source . string)))
                  (output . ((diagnostics . array))))
      (noteg_format (description . "Format NoteG source")
                    (input . ((source . string)))
                    (output . ((formatted . string)))))
    (meta-tools
      (adapter_list (description . "List available SSG adapters")
                    (output . ((adapters . array))))
      (adapter_status (description . "Check adapter connection status")
                      (input . ((adapter . string)))
                      (output . ((connected . boolean) (version . string)))))))

(define agent-workflows
  '((site-creation
      (description . "Create and configure new SSG site")
      (steps . ("select-adapter" "init-site" "configure" "add-content" "build" "deploy"))
      (autonomy . "semi-autonomous")
      (requires-approval . ("deploy")))
    (content-migration
      (description . "Migrate content between SSG formats")
      (steps . ("analyze-source" "map-frontmatter" "convert-templates" "validate" "migrate"))
      (autonomy . "supervised")
      (requires-approval . ("migrate")))
    (multi-site-build
      (description . "Build multiple sites in parallel")
      (steps . ("discover-sites" "validate-configs" "parallel-build" "aggregate-results"))
      (autonomy . "autonomous")
      (max-parallelism . 4))))

(define autonomous-actions
  '((allowed
      (read-files . #t)
      (write-generated-files . #t)
      (run-builds . #t)
      (run-tests . #t)
      (format-code . #t)
      (lint-code . #t))
    (requires-approval
      (git-commit . #t)
      (git-push . #t)
      (deploy-production . #t)
      (modify-config . #t)
      (install-dependencies . #t))
    (forbidden
      (delete-source-files . #t)
      (modify-credentials . #t)
      (access-external-apis . #t)
      (execute-arbitrary-code . #t))))
