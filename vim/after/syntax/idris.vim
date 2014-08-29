" don't highlight type declarations differently
syntax clear idrisIdentifier
syntax match idrisType /\<\([A-Z][a-zA-Z0-9_']*\|_|_\)\>/
