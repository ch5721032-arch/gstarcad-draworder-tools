;; order-under.lsp - Place one object directly under another
;; Command: UNDER
;; Usage: pick the object to move, then the object it should sit under
(defun c:UNDER ( / ea eb )
  (setq ea (car (entsel "\nPick the object to move: "))
        eb (car (entsel "\nPick the object it should sit under: ")))
  (if (and ea eb)
    (progn
      (command "_.DRAWORDER" ea "" "_U" eb)
      (princ "\nDraw order updated.")
    )
  )
  (princ)
)
