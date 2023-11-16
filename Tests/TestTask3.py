import subprocess
import unittest


class TestTask3(unittest.TestCase):

    def test_normal(self):
        result = subprocess.run(["../Scripts/Task3.sh 2007 2007 Пивоварение ../labfiles"], shell=True,
                                stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         "In 2007 students with maximum result (25 correct answers):\n" +
                         "MelnikovD BaryshevaT Surovtsev-ButovA PashkovskyA SeLou\n")

    def test_not_existing_year(self):
        result = subprocess.run(["../Scripts/Task3.sh 2000 2000 Пивоварение ../labfiles"], shell=True,
                                stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "No tests in 2000\n")

    def test_result_with_similar_students(self):
        result = subprocess.run(["../Scripts/Task3.sh 2080 2080 . ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         "In 2080 students with maximum result (1 correct answers):\n" +
                         "Test TestA\n")

    def test_large_input(self):
        result = subprocess.run(["../Scripts/Task3.sh 2000 2002 . ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         "In 2000 students with maximum result (50 correct answers):\n" +
                         "Gino Naomi Ann Carol Juanita Dara Shantel Jaime Charlie Ira\n" +
                         "In 2001 students with maximum result (50 correct answers):\n"
                         "Faye Isabelle Nicholas Erica Dora Joanne Dawn Brian Lara Janice Stephen Ana Herbert\n"
                         "In 2002 students with maximum result (50 correct answers):\n"
                         "Elza Nathaniel Craig Stanley Shantel Son Glendora Patrick\n")

    def test_wrong_years(self):
        result = subprocess.run(["../Scripts/Task3.sh 2004 2002 . ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "The left value of the year is greater than the right one\n")

    def test_negative_year(self):
        result = subprocess.run(["../Scripts/Task3.sh -2004 -2002 . ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,"Year can't be negative\n")
    def test_wrong_amount_of_arguments(self):
        result = subprocess.run(["../Scripts/Task3.sh one two three four ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong number of arguments\n")


if __name__ == '__main__':
    unittest.main()
