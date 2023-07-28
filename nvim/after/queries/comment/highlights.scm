;; extends

((tag
  (name) @text.todo @nospell
  ("(" @punctuation.bracket (user) @constant ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @text.todo "TODO" "WIP" "FIXME" "NOCOMMIT" "NYI" "NOTE"))

("text" @text.todo @nospell
 (#any-of? @text.todo "TODO" "WIP" "FIXME" "NOCOMMIT" "NYI" "NOTE"))
