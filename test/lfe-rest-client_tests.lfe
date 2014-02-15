(defmodule lfe-rest-client_tests
  (export all)
  (import
    (from lfeunit-util
          (check-failed-assert 2)
          (check-wrong-is-exception 2))
    (rename lfe-rest-client
            ((get-default-headers 1) get-headers))
    (from lfe-rest-client-util
          (get-body 1))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest get-default-headers
  (let* ((result (get-headers '"my-content-type"))
         (data-check (element 2 (car result)))
         (count (length result)))
    (is-equal '"my-content-type" data-check)
    (is-equal 2 count)))

(deftest get-sync
  (: inets start)
  (: meck new 'httpc)
  (: meck expect 'httpc 'request 4 (: testing-payloads simple-success))
  (try
    (let* ((raw-result (: lfe-rest-client-sync get '"http://my-url"))
           (result (get-body raw-result)))
      (is-equal '"<html><body>Yay!</body></html>" result))
    (after
      (: meck validate 'httpc)
      (: meck unload 'httpc)
      (: inets stop))))