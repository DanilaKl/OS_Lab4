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
                         ".\n"+
                         "Lessons with maximum attendance (3  present):\n" +
                         "1 2 3\n")


if __name__ == '__main__':
    unittest.main()