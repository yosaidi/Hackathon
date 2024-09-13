-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 22, 2024 at 01:21 PM
-- Server version: 8.0.39-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saher_base`
--

-- --------------------------------------------------------

--
-- Table structure for table `my_problems`
--

CREATE TABLE `my_problems` (
  `id` int NOT NULL,
  `problem_name` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `expected_function` text NOT NULL,
  `expected_test` text NOT NULL,
  `expected_output` text NOT NULL,
  `release_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `my_problems`
--

INSERT INTO `my_problems` (`id`, `problem_name`, `problem_description`, `expected_function`, `expected_test`, `expected_output`, `release_time`) VALUES
(1, 'eightqueens', 'Write a function that prints the solutions to the eight queens puzzle.\r\n\r\nRecursivity must be used to solve this problem.\r\n\r\nIt should print something like this :', 'func EightQueens() {\r\n\r\n}', '$ go run .', '15863724\r\n16837425\r\n17468253\r\n...', '2024-08-21 13:54:37'),
(2, 'Roman Numbers', 'Write a program called rn. The objective is to convert a number, given as an argument, into a roman number and print it with its roman number calculation.\r\n\r\nThe program should have a limit of 4000. In case of an invalid number, for example \"hello\" or 0 the program should print ERROR: cannot convert to roman digit.\r\n\r\nWrite a program called rn. The objective is to convert a number, given as an argument, into a roman number and print it with its roman number calculation.\r\n\r\nThe program should have a limit of 4000. In case of an invalid number, for example \"hello\" or 0 the program should print ERROR: cannot convert to roman digit.', '/* You Are Free */', '$ go run . hello\r\n$ go run . 123\r\n$ go run . 999\r\n$ go run . 3999\r\n$ go run . 4000', '$ ERROR: cannot convert to roman digit\r\n\r\n$ C+X+X+I+I+I\r\nCXXIII\r\n\r\n$ (M-C)+(C-X)+(X-I)\r\nCMXCIX\r\n\r\n$ M+M+M+(M-C)+(C-X)+(X-I)\r\nMMMCMXCIX\r\n\r\n$ ERROR: cannot convert to roman digit', '2024-08-21 16:14:02'),
(3, 'itoabase', 'Write a function that:\r\n\r\nconverts an int value to a string using the specified base in the argument\r\nand that returns this string\r\nThe base is expressed as an int, from 2 to 16. The characters comprising the base are the digits from 0 to 9, followed by uppercase letters from A to F.\r\n\r\nFor example, the base 4 would be the equivalent of \"0123\" and the base 16 would be the equivalent of \"0123456789ABCDEF\".\r\n\r\nIf the value is negative, the resulting string has to be preceded by a minus sign -.\r\n\r\nOnly valid inputs will be tested.', 'func ItoaBase(value, base int) string {\r\n\r\n}', 'func main() {\r\n	fmt.Println(piscine.ItoaBase(10, 2))\r\n	fmt.Println(piscine.ItoaBase(255, 16))\r\n	fmt.Println(piscine.ItoaBase(-42, 4))\r\n	fmt.Println(piscine.ItoaBase(123, 10))\r\n	fmt.Println(piscine.ItoaBase(0, 8))\r\n	fmt.Println(piscine.ItoaBase(255, 2))\r\n	fmt.Println(piscine.ItoaBase(-255, 16))\r\n	fmt.Println(piscine.ItoaBase(15, 16))\r\n	fmt.Println(piscine.ItoaBase(10, 4))\r\n	fmt.Println(piscine.ItoaBase(255, 10))\r\n}', '// Output: 1010\r\n// Output: FF\r\n// Output: -222\r\n// Output: 123\r\n// Output: 0\r\n// Output: 11111111\r\n// Output: -FF\r\n// Output: F\r\n// Output: 22\r\n// Output: 255', '2024-08-22 13:43:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `my_problems`
--
ALTER TABLE `my_problems`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `my_problems`
--
ALTER TABLE `my_problems`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
