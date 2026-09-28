;; bring-to-front.lsp - Bring selected objects to the front
;; Command: TOFRONT
;; Usage: select objects; they jump above everything else
(defun c:TOFRONT ( / ss )
  (setq ss (ssget "\nSelect objects to bring to front: "))
  (if ss
    (progn
      (command "_.DRAWORDER" ss "" "_F")
      (princ (strcat "\n" (itoa (sslength ss)) " objects brought to front."))
    )
  )
  (princ)
)
