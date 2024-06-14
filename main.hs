import Text.Printf
import Text.Read (readMaybe)

subtractVectors :: [Double] -> [Double] -> [Double]
subtractVectors = zipWith (-)

validateInput :: String -> IO Double
validateInput prompt = do
    putStrLn prompt
    input <- getLine
    case readMaybe input of
        Just number -> return number
        Nothing -> do
            putStrLn "Sorry, the input you provided is invalid. Please try again."
            validateInput prompt

formatVector :: [Double] -> String
formatVector vector = "[" ++ unwords (map show vector) ++ "]"

main = do
    x1 <- validateInput "Enter x1's value."
    y1 <- validateInput "Enter y1's value."
    x2 <- validateInput "Enter x2's value."
    y2 <- validateInput "Enter y2's value."

    let vector1 = [x1, y1]
    let vector2 = [x2, y2]
    let vector3 = subtractVectors vector1 vector2

    printf "The difference of vectors %s and %s is %s.\n"
        (formatVector vector1)
        (formatVector vector2)
        (formatVector vector3)
