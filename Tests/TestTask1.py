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

if __name__ == '__main__':
    unittest.main()