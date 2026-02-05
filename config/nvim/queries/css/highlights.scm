;; extends

((selectors) @selectors
  (#set! "priority" 110))

((property_name) @property
  (#set! "priority" 110))

([(integer_value) (plain_value)] @value
  (#set! "priority" 110))

(feature_query
  (plain_value) @value
  (#set! "priority" 110))

; Isso
; (call_expression
;   (function_name)
;   (arguments
;     (plain_value))))

; Vira isso
(call_expression
  (arguments
    (plain_value) @value)
  (#set! "priority" 110))
