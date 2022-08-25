import getpass, re
from sys import platform
from collections import Counter

user_login = getpass.getuser()


def zsh_history():
    if platform == 'linux':
        zsh_file = f"/home/{user_login}/.zsh_history"
    if platform == 'darwin':
        zsh_file = f"/users/{user_login}/.zsh_history"
    values = []
    try:
        with open(zsh_file, encoding="ISO-8859-15") as z:
            for i in z.read().splitlines():
                if i and re.sub(r'^.*?;', ';', i)[0] == ';':
                    values.append(re.sub(r'^.*?;', ';', i)[1:])
                else:
                    values.append(re.sub(r'^.*?;', ';', i))
    except FileNotFoundError:
        if platform == 'linux':
            return print("No file '.zsh_history' was found in home directory")
        if platform == 'darwin':
            return print("No file '.zsh_history' was found in users directory")
    else:
        for k, v in Counter(values).most_common()[::-1]:
            print(f"{k}, \033[1m{v} times\033[0m")


zsh_history()
