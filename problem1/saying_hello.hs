main = ask "Hi there! What's your name?" >>
       greet (\name -> "Nice to meet you " ++ name ++ "!")

ask question       = putStrLn question
greet phrasingName = getLine >>= phrasingName >>> putStrLn

(>>>) = flip (.)
