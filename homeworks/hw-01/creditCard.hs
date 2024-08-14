{- VALIDASI NOMOR KARTU KREDIT -}
-- Ubah input nomor kartu kredit dari Integer jadi [Integer] dan dibalik
toDigitsRev :: Integer -> [Integer]
toDigitsRev n
  | n < 10 = [n]
  | otherwise = n `mod` 10 : toDigitsRev (n `div` 10)

-- Kalikan dengan dua setiap 2 digit dari belakang
-- Misalnya [6, 1, 3, 8, 6] jadi [6, 2, 3, 16, 6]
doubleEveryOtherRev :: [Integer] -> [Integer]
doubleEveryOtherRev [] = []
doubleEveryOtherRev [x] = [x]
doubleEveryOtherRev (x : y : zs) = x : y + y : doubleEveryOtherRev zs

-- Tambahkan setiap angka dari hasil yang tadi
-- Misal, 6 + 2 + 3 + 1 + 6 + 6 = 24
addDigitMoreThanTen :: Integer -> Integer
addDigitMoreThanTen n
  | n < 10 = n
  | otherwise = sumDigits (toDigitsRev n)

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits [x] = x
sumDigits (x : y : zs) = addDigitMoreThanTen x + addDigitMoreThanTen y + sumDigits zs

-- Cari sisa dari penjumlahan tadi jika dibagi 10
-- Pada permisalan tadi, akan menghasilkan nilai 4
-- Jika sisa yg dihasilkan 0, maka nomor kartu kredit valid
dividibleByTen :: Integer -> Bool
dividibleByTen n = n `mod` 10 == 0

-- Main function
validate :: Integer -> Bool
validate n = dividibleByTen (sumDigits (doubleEveryOtherRev (toDigitsRev n)))

-- Test input
input1 :: Integer
input1 = 4012888888881881

input2 :: Integer
input2 = 4012888888881882

main :: IO ()
main = do
  -- input1: True
  -- input2: False
  print (validate input1)
  print (validate input2)

-- PASSED!