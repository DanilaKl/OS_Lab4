import subprocess
import unittest


class TestTask4(unittest.TestCase):

    def test_normal(self):
        result = subprocess.run(["../Scripts/Task4.sh A-09-20 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         "Криптозоология\n" +
                         "Lessons with minimum attendance (8  missing):\n" +
                         "9 14\n" +
                         "Пивоварение\n" +
                         "Lessons with minimum attendance (8  missing):\n" +
                         "10\n")

    def test_not_existing_group(self):
        result = subprocess.run(["../Scripts/Task4.sh A-34-89 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong group number\n")

    def test_min_lesson(self):
        result = subprocess.run(["../Scripts/Task4.sh TEST ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         ".\n" +
                         "Lessons with minimum attendance (2  missing):\n" +
                         "4\n")

    def test_large_input(self):
        result = subprocess.run(["../Scripts/Task4.sh test_group_large ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         ".\n" +
                         "Lessons with minimum attendance (292  missing)::\n" +
                         "5\n")


if __name__ == '__main__':
    unittest.main()
