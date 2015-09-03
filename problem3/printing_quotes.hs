main = askForQuoteAndAuthor >>= displayQuoteAndAuthor

askForQuoteAndAuthor = do
  quote  <- ask "What is the quote?"
  author <- ask "Who said it?"
  return (quote, author)
ask question = putStrLn question >> getLine

displayQuoteAndAuthor = present >>> putStrLn
present (quote, author) = author ++ " says, \"" ++ quote ++ "\""

(>>>) = flip (.)
