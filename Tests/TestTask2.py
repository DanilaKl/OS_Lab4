import subprocess
import unittest


class TestTask2(unittest.TestCase):

    def test_normal(self):
        result = subprocess.run(["../Scripts/Task2.sh A-09-20 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                          "Students with maximum 3 (7 grades): KukinVA\n" +
                          "Students with maximum 4 (7 grades): BijoyA\n" +
                          "Students with maximum 5 (3 grades): SukhanovVS TikhonovAVad\n")

    def test_not_existing_group(self):
        result = subprocess.run(["../Scripts/Task2.sh A-34-89 ../labfiles"], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout, "Wrong group number\n")

    def test_result_with_similar_students(self):
        result = subprocess.run(["../Scripts/Task2.sh TEST ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                          "No students with 3\n" +
                          "No students with 4\n" +
                          "Students with maximum 5 (1 grades): Test TestA\n")

    def test_student_with_not_one_max_grade(self):
        result = subprocess.run(["../Scripts/Task2.sh TEST2 ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                          "Students with maximum 3 (1 grades): Test\n" +
                          "Students with maximum 4 (1 grades): Test\n" +
                          "Students with maximum 5 (1 grades): Test\n")
    def test_large_input(self):
        result = subprocess.run(["../Scripts/Task2.sh test_group_large ."], shell=True, stdout=subprocess.PIPE,
                                text=True)
        self.assertEqual(result.stdout,
                          "Students with maximum 3 (24 grades): Susan\n" +
                          "Students with maximum 4 (25 grades): Don\n" +
                          "Students with maximum 5 (24 grades): Ann\n")

if __name__ == '__main__':
    unittest.main()
