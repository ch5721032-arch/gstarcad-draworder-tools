;; send-to-back.lsp - Send selected objects behind everything else
;; Command: TOBACK
(defun c:TOBACK ( / ss )
  (setq ss (ssget "\nSelect objects to send to back: "))
  (if ss
    (progn
      (command "_.DRAWORDER" ss "" "_B")
      (princ (strcat "\n" (itoa (sslength ss)) " objects sent to back."))
    )
  )
  (princ)
)
