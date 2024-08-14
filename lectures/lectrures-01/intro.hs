{- Hahaha -}
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

{- Int ada batasannya, yakni dari (-2^29) sampai (2^29 - 1)-}
i :: Int
i = -78

{- Sedangkan Integer, dia tidak memiliki batasan (infinite range) -}
n :: Integer
n = 1234567890987654321987340982334987349872349874534

{- Ahh, fungsi show untuk konversi apapun ke String -}
a :: String
a = show n

{- Kemudian ada fungsi length buat nyari panjang karakter dalam String -}
len :: Int
len = length a

-- Int gabisa ditambah Integer
-- badArith1 :: Int
-- badArith1 = i + n

-- Melainkan kudu panggil fromIntegral dulu ke Int atau Integer
-- Atau round, floor, ceiling ke Int dan Integer
niceArith1 :: Integer
niceArith1 = fromIntegral i + n

-- Ini juga gabisa karena "/" cuma bisa dipake di tipe float atau desimal
-- badArith2 :: Int
-- badArith2 = i / i

-- Instead, kita pake `div` ae
ex09 :: Int
ex09 = i `div` i

ex10 :: Integer
ex10 = 12 `div` 5

-- Bikin basic function
hailstone :: Integer -> Integer
hailstone n
  | even n = n `div` 2 -- Kalau n genap, kita bagi dengan 2
  | otherwise = 3 * n + 1 -- Otherwise, kalikan dengan 3 lalu tambah 1

-- Cara manggilnya sebagaimana pada langkah sebelumnya
-- Tinggal "namafungsi arg1 arg2 ..."
res :: Integer
res = hailstone 11 -- Harusnya 34

-- Masuk ke Pairs
-- Katanya si ga usah dipake, ntar kita lihat aja
p :: (Int, Char)
-- Tentu harus ikutin tipe nya
-- p = ('x', 3)
p = (3, 'x')

-- Function with multiple arguments
-- Format tipenya: Arg1Type -> Arg2Type -> ... -> ResultType
f :: Int -> Int -> Int -> Int
f x y z = x + y + z

-- Tambahan
-- Jangan tulis: f 3 n+1 7
-- Karena bakal dikira (f 3 n) + (1 7)
-- Instead, tulis kayak gini: f 3 (n + 1) 7

ex17 :: Int
ex17 = f 12 8 20 -- This should be 40

-- List
nums, range, range2 :: [Integer]
nums = [2, 4, 6, 7, 12]
range = [1 .. 100] -- Kita bisa buat range dari n sampai m (termasuk m) pakai .. (kayak kotlin yah)
range2 = [2, 4 .. 100]

-- Ahh, macem C++ ternyata
-- Petik 2 buat String, petik 1 buat Char
hello1 :: [Char]
hello1 = ['A', 'z', 'i', 'z']

hello2 :: String
hello2 = "Aziz"

helloSame :: Bool
-- Ini akan bernilai True
-- Karena cara kerja String di Haskell itu sama kayak List of Char
helloSame = hello1 == hello2

-- Membangun List
emptyList = []

ex18 :: [Integer]
ex18 = 1 : [] -- Jadi [1]

ex19 :: [Integer]
ex19 = 3 : (1 : []) -- Jadi [3, 1]

ex20 :: [Integer]
ex20 = 2 : 3 : 4 : [] -- Jadi [2, 3, 4]
{- Catatan: Mereka semua hanyalah linked lists BUKAN array -}

-- Rekursi?
-- Generate the sequence of hailstone iterations from a starting number
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

-- Functions on lists
sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = [] -- Kalau arg nya list kosong, return list kosong
sumEveryTwo (x : []) = [x] -- Kalau arg nya cuma list dengan panjang 1, return list itu lagi
sumEveryTwo (x : y : zs) = (x + y) : sumEveryTwo zs -- Otherwise, kita ambil x dan y, lalu sisanya akan masuk ke dalam zs

-- Combining functions
hailstoneLen :: Integer -> Int
hailstoneLen n = length (show (hailstoneSeq n)) - 1

main :: IO ()
main = do
  print (hailstoneLen 1000)

-- Ini komentar
{- Ini juga komentar -}