(defmodule lfe-rest-client-sync
  (export all)
  (import
    (from lfe-rest-client
      (get-default-headers 1))
    (rename lfe-rest-client
            ((sync-request 2) http))))

(defun post (url payload)
  (let* ((content-type (: lfe-rest-client-conf default-content-type))
         (headers (get-default-headers content-type))
         (request-data (tuple url headers content-type payload)))
  (http 'post request-data)))

(defun get (url)
  (let* ((content-type (: lfe-rest-client-conf default-content-type))
         (headers (get-default-headers content-type))
         (request-data (tuple url headers)))
  (http 'get request-data)))