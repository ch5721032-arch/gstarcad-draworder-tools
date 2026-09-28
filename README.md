# GstarCAD Draw Order Tools

Bring a selection to the front, send it behind everything, or tuck one object directly under another.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Text, dimensions and hatches fight over what draws on top. These commands bring a selection to the front, send it behind everything else, and place one object directly under another, so labels stay readable and patterns stop hiding geometry.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/bring-to-front.lsp` | ;; bring-to-front.lsp - Bring selected objects to the front
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
 |
| `scripts/send-to-back.lsp` | ;; send-to-back.lsp - Send selected objects behind everything else
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
 |
| `scripts/order-under.lsp` | ;; order-under.lsp - Place one object directly under another
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
