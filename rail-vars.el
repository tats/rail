;;; rail-vars.el --- Replace Agent-string Internal Library

;; Copyright (C) 1999 by Free Software Foundation, Inc.

;; Author: SHIMADA Mitsunobu <simm-emacs@fan.gr.jp>
;; Keywords: i18n, internal, rail

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;

;;; Code:

(require 'rail-table-semi)
(require 'rail-table-flim)
(require 'rail-table-mule)

(defvar rail-version "1.2.12"
  "Version number of rail.el")

(defvar rail-temporary-buffer-name " *Rail*"
  "Temporary buffer to replace codename string")

;; replace candidates for replacement
(defvar rail-product-name-alist
  '(("SEMI"          . semi)
    ("SEMI-EPG"      . semi)
    ("WEMI"          . semi)
    ("REMI"          . semi)
    ("WREMI"         . semi)
    ("EMIKO"         . semi)
    ("WEMIKO"        . semi)
    ("FLIM"          . flim)
    ("CLIME"         . flim)
    ("CHAO"          . flim)
    ("LIMIT"         . flim)
    ("MULE"          . mule)
    )
  "Association-list of product name.
Each pair is '(\"Name\" . kind)")

;; Mule UTF-2000-MULE version format
(defvar rail-mule-version-header-format
  "\\([.0-9]+\\|[.0-9]+ Beta[0-9]*\\) (\\([^()]+\\))"
  "Format of mule-version, utf-2000-version string.
This variable is used in `rail-replace-codename-primitive'.")

;; mime-view-version format
(defvar rail-mime-view-version-format
  "\\([A-Za-z]+\\) MIME-View [.0-9]+ (\\([^()]*\\))"
  "`mime-view-version' format.")

;; MIME-Version: header format
(defvar rail-mime-version-header-format
  "[.0-9]+ (generated by \\([A-Za-z]+\\) [.0-9]+ - \"\\([^()]*\\)\")"
  "MIME-Version: header pattern.")

;; User-Agent: header
(defvar rail-mime-version-header-item-list
  '("MIME-Header")
  "Headers in which codename replaces.
Each codename should be aligned like rail-mime-version-header-format.")

;; User-Agent: header format
(defvar rail-user-agent-header-format
  "\\([.0-9]+\\|[.0-9]+ Beta[0-9]*\\)[ \t\r\n]+(\\([^()]+\\))"
  "User-Agent: header pattern. Each products are written like below.
ex. LIMIT/1.13.4 (Harinakano)

match-data 1: interface product name
match-data 2: codename")

;; User-Agent: header
(defvar rail-user-agent-header-item-list
  '("User-Agent" "X-Mailer" "X-Newsreader")
  "Headers in which codename replaces.
Each codename should be aligned like `rail-user-agent-header-format'.")

;; CTCP VERSION format
(defvar rail-pj-mule-format "\\([.0-9]+\\) (\\([^()]+\\))"
  "CTCP VERSION format for Mule version")
(defvar rail-pj-utf-2000-format "[/ ][.0-9]+"
  "CTCP VERSION format for UTF-2000-MULE version")
(defvar rail-pj-utf-2000-retry-format "\\([.0-9]+\\) (\\([^\"]+\\))"
  "CTCP VERSION format for UTF-2000-MULE version (Retry)")

;; customizable variables
(defvar rail-additional-semi-codename-alist nil
  "Additional codename for SEMI.")
(defvar rail-additional-flim-codename-alist nil
  "Additional codename for FLIM.")
(defvar rail-additional-mule-codename-alist nil
  "Additional codename for Mule.")

;; replace original codename or not
(defvar rail-user-agent-replace-mime-library-product t
  "If non-nil, replace FLIM codename.")
(defvar rail-user-agent-replace-mime-user-interface-product t
  "If non-nil, replace SEMI codename.")
(defvar rail-emulate-genjis t
  "If non-nil, replace MULE version.")

;; for rail-pj
(defvar rail-pj-convert t
  "Convert codename in CTCP VERSION string.")

;; for rail-user-agent
(defvar rail-user-agent-convert-statically t
  "Convert codename statically.
If non-nil, rail replaces `mime-edit-user-agent-value' and `mime-edit-mime-version-value'.")
(defvar rail-user-agent-convert-dynamically t
  "Convert codename dynamically.
If non-nli, rail replaces User-Agent: and MIME-Version: header
after `mime-edit-translate-body'.")
(defvar rail-user-agent-replace-into-iso8859-4 t
  "Convert ISO-8859-1 codename into ISO-8859-4.
If nil, stop to convert via (rail-user-agent-replace-into-iso8859-4)")
(defvar rail-user-agent-convert-mime-example t
  "Convert SEMI codename on .mime-example.")

;; conversion direction
(defvar rail-convert-direction t
  "Define convert direction.
If non-nil, rail replaces ISO-8859-4 into Japanese.
If nil, rail replaces Japanese into ISO-8859-4.")

(provide 'rail-vars)

;;; rail-vars.el ends here
