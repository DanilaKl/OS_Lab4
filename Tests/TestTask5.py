import subprocess
import unittest


class TestTask5(unittest.TestCase):

    def test_normal(self):
        result = subprocess.run(["../Scripts/Task5.sh A-09-20 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         "Криптозоология\n" +
                         "Lessons with maximum attendance (15  present):\n" +
                         "5\n" +
                         "Пивоварение\n" +
                         "Lessons with maximum attendance (15  present):\n" +
                         "13\n")

    def test_not_existing_group(self):
        result = subprocess.run(["../Scripts/Task5.sh A-34-89 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong group number\n")

    def test_max_lesson(self):
        result = subprocess.run(["../Scripts/Task5.sh TEST ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         ".\n" +
                         "Lessons with maximum attendance (3  present):\n" +
                         "1 2 3\n")

    def test_large_input(self):
        result = subprocess.run(["../Scripts/Task5.sh test_group_large ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                         ".\n" +
                         "Lessons with maximum attendance (291  present):\n" +
                         "3\n")

    def test_wrong_amount_of_arguments(self):
        result = subprocess.run(["../Scripts/Task5.sh one two three four ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong number of arguments\n")


if __name__ == '__main__':
    unittest.main()
