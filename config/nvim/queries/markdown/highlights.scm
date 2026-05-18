;; extends

; (atx_heading
;   [ (atx_h1_marker) (atx_h2_marker) (atx_h3_marker)
;     (atx_h4_marker) (atx_h5_marker) (atx_h6_marker)
;   ] @markup.operator)
;
(((fenced_code_block_delimiter)
  (#set! "priority" 110)) @markup.heading.1)

;; vim: ft=query
