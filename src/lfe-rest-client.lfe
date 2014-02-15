(defmodule lfe-rest-client
  (export all))

(defun get-default-headers (content-type)
  (list (tuple (: lfe-rest-client-conf content-type)
               content-type)
        (tuple (: lfe-rest-client-conf user-agent)
               (: lfe-rest-client-conf user-agent-string))))

(defun async-request (method request-data)
  (: lfe-rest-client-util start-services)
  (let* ((http-options ())
         (options (list (tuple 'sync 'false))))
    (: httpc request method request-data http-options options)))

(defun sync-request (method request-data)
  (: lfe-rest-client-util start-services)
  (let* ((http-options ())
         (options ()))
    (: httpc request method request-data http-options options)))