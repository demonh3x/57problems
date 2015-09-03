main = askForText >>= addLength >>> displayTextAndLength

askForText = putStrLn "What is the input text?" >> getLine

displayTextAndLength = present >>> putStrLn
present (text, length) =
  text ++ " has " ++ show length ++ " characters."

addLength text = (text, length text)

(>>>) = flip (.)
