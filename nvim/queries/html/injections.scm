((script_element
  (raw_text) @injection.content)
 (#set! injection.language "javascript"))

((style_element
  (raw_text) @injection.content)
 (#set! injection.language "css"))

(
  (
    (attribute_name) @constant (#match? @constant "onclick")
    (quoted_attribute_value (attribute_value) @injection.content)
  )
 (#set! injection.language "javascript")
)

(
  (
    (attribute_name) @constant (#match? @constant "style")
    (quoted_attribute_value (attribute_value) @injection.content)
  )
 (#set! injection.language "css")
)
