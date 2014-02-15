(defmodule lfe-rest-client-conf
  (export all))

;; HTTP Header Names
(defun content-type () '"Content-Type")
(defun default-content-type () '"application/json")
(defun user-agent () '"User-Agent")
(defun x-auth-user () '"X-Auth-User")
(defun x-auth-key () '"X-Auth-Key")
(defun x-storage-url () '"X-Storage-Url")
(defun x-auth-token () '"X-Auth-Token")

;; User Agent Data
(defun user-agent-name () '"LFE (Lisp Flavored Erlang) REST Client")
(defun user-agent-version () '"0.0.1")
(defun user-agent-url () '"(+https://github.com/oubiwann/lfe-rest-client)")
(defun user-agent-string () (++ (user-agent-name)
                                '"/"(user-agent-version)
                                '" "(user-agent-url)))