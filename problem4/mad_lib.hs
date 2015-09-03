import Text.Printf

main = askForWords >>= constuctStory >>> putStrLn

askForWords = do
  noun      <- ask "Enter a noun:"
  verb      <- ask "Enter a verb:"
  adjective <- ask "Enter an adjective:"
  adverb    <- ask "Enter an adverb:"
  return (noun, verb, adjective, adverb)
ask thing = putStrLn thing >> getLine

constuctStory (noun, verb, adjective, adverb) =
  printf "Do you %s your %s %s %s? That's hilarious!"
         verb adjective noun adverb

(>>>) = flip (.)
