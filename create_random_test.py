import random

import names

with open("Tests/students/groups/test_group_large", "w") as file:
    students = set()
    for i in range(1000):
        name = names.get_first_name()
        if name in students:
            continue
        students.add(name)
        file.write(name + "\n")

with open("Tests/students/groups/test_group_large", "r") as group:
    with open("Tests/test_group_large-attendance", "w") as att:
        for string in group:
            att.write(string[:len(string) - 1] + " " + bin(random.randint(0, 262143))[2:].zfill(18) + "\n")

with open("Tests/students/groups/test_group_large", "r") as group:
    students = []
    for st in group:
        students.append(st[:len(st)-1])
    with open("Tests/test_files/TEST-2", "w") as test:
        for i in range(10000):
            res = "test_group_large;" + str(random.choice(students)) + ";" + str(random.randint(2000, 2023)) + ";" + str(random.randint(0, 50)) + ";" + str(random.randint(2, 5))+"\n"
            test.write(res)
