import getpass, time
from sys import platform
from collections import Counter

user_login = getpass.getuser()


def bash_history():
    if platform == 'linux':
        bash_file = f"/home/{user_login}/.bash_history"
    if platform == 'darwin':
        bash_file = f"/users/{user_login}/.bash_history"
    values = []
    try:
        with open(bash_file, encoding="ISO-8859-15") as b:
            for line in b.read().splitlines():
                values.append(line)
    except FileNotFoundError:
        if platform == 'linux':
            return print("No file '.bash_history' was found in home directory")
        if platform == 'darwin':
            return print("No file '.bash_history' was found in users directory")
    else:
        for k, v in Counter(values).most_common()[::-1]:
            print(f"{k}, \033[1m{v} times\033[0m")



bash_history()


