" this is erroneously highlighted as an error
syn clear rustInvalidBareKeyword

" add missing async/await keywords
syn match rustKeyword "async"
syn match rustKeyword "await"
