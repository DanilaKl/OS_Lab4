import subprocess
import unittest


class TestTask1(unittest.TestCase):

    def test_normal_group(self):
        result = subprocess.run(["../Scripts/Task1.sh A-09-20 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Students with maximum attendance (18  studies):\nGumerovaEF\n")

    def test_not_existing_group(self):
        result = subprocess.run(["../Scripts/Task1.sh A-34-89 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong group number\n")

    def test_group_with_similar_students(self):
        result = subprocess.run(["../Scripts/Task1.sh TEST ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Students with maximum attendance (4  studies):\nTest\n")

    def test_group_with_not_one_max_student(self):
        result = subprocess.run(["../Scripts/Task1.sh TEST2 ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Students with maximum attendance (4  studies):\nTest TestA\n")

    def test_large_input(self):
        result = subprocess.run(["../Scripts/Task1.sh test_group_large ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Students with maximum attendance (15  studies):\nAmber Alice Gerard\n")

    def test_wrong_amount_of_arguments(self):
        result = subprocess.run(["../Scripts/Task1.sh one two three four ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong number of arguments\n")


if __name__ == '__main__':
    unittest.main()
