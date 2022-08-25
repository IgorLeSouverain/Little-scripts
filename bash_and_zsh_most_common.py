import getpass, re
from sys import platform
from collections import Counter

user_login = getpass.getuser()


def zsh_bash_history():
    if platform == 'linux':
        bash_file = f"/home/{user_login}/.bash_history"
        zsh_file = f"/home/{user_login}/.zsh_history"
    if platform == 'darwin':
        bash_file = f"/users/{user_login}/.bash_history"
        zsh_file = f"/users/{user_login}/.zsh_history"
    values = []
    try:
        with open(bash_file, encoding="ISO-8859-15") as b, open(zsh_file, encoding="ISO-8859-15") as z:
            for line in b.read().splitlines():
                values.append(line)
            for line in z.read().splitlines():
                if line and re.sub(r'^.*?;', ';', line)[0] == ';':
                    values.append(re.sub(r'^.*?;', ';', line)[1:])
                else:
                    values.append(re.sub(r'^.*?;', ';', line))
    except FileNotFoundError:
        if platform == 'linux':
            for k, v in Counter(values).most_common()[::-1]:
                print(f"{k}, \033[1m{v} times\033[0m")
            return print("Either no .zsh_history or .bash_history in home directory")
        if platform == 'darwin':
            for k, v in Counter(values).most_common()[::-1]:
                print(f"{k}, \033[1m{v} times\033[0m")
            return print("Either no .zsh_history or .bash_history in users directory")
    else:
        for k, v in Counter(values).most_common()[::-1]:
            print(f"{k}, \033[1m{v} times\033[0m")


zsh_bash_history()

