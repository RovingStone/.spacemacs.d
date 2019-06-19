(with-eval-after-load 'org
  ;; General
  (setq org-directory "~/Documents/org")

  ;; Encryption
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  (setq org-crypt-key "88B781F21BB3D3AB")
  (setq auto-save-default nil)

  ;; org-journal
  (setq org-journal-dir "~/Documents/journal/")

  ;; org-projectile
  (setq org-projectile-file "TODOs.org")
  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (mapcar #'(lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
            (org-projectile-todo-files)))

  ;; TODO keywords
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
        '(("TODO" . org-todo)
          ("STARTED" . org-scheduled-today)
          ("DONE" . org-done)))

  ;; Notes
  (setq org-default-notes-file "~/Documents/org/notes.org")

  ;; Agenda
  (setq org-agenda-files '("~/Documents/org/tasks/"
                           "~/Documents/org/notes.org"))

  ;; Capture templates
  (setq org-capture-templates
        '(("t" "Todos")
          ("tt" "Basic todo" entry (file+headline "~/Documents/org/tasks/main.org" "Common")
           "* TODO %^{Description}%?\n" :empty-lines-before 1)
          ("tc" "Todo with checkbox(es)" entry (file+headline "~/Documents/org/tasks/main.org" "Common")
           "* TODO %^{Description} [/] [%]\n - [ ] %?\n" :empty-lines-before 1)

          ("l" "Learn")
          ("lt" "TODO" entry (file+headline "~/Documents/org/tasks/learn.org" "Learn")
           "* TODO %?\n" :empty-lines-before 1)
          ("ll" "Captured link" entry (file+headline "~/Documents/org/tasks/learn.org" "Learn")
           "* TODO %A\n" :empty-lines-before 1)
          ("lc" "Clipboard content" entry (file+headline "~/Documents/org/tasks/learn.org" "Learn")
           "* TODO %c%?\n" :empty-lines-before 1)
          ("lx" "X-clipboard content" entry (file+headline "~/Documents/org/tasks/learn.org" "Learn")
           "* TODO %x%?\n" :empty-lines-before 1)))
  )
