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
        result = subprocess.run(["../Scripts/Task3.sh 2007 2007 . ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         "In 2007 students with maximum result (1 correct answers):\n" +
                         "Test TestA\n")


if __name__ == '__main__':
    unittest.main()
