import getpass
from sys import platform
from collections import Counter


def bash_history():
    
    user_login = getpass.getuser()

    if platform == 'linux':
        bash_file = f"/home/{user_login}/.bash_history" 
    elif platform == 'darwin':
        bash_file = f"/users/{user_login}/.bash_history"
    else:
        return print("Doesn't work on windows")

    try:
        with open(bash_file, encoding="ISO-8859-15") as bash:
            for k, v in Counter(bash).most_common()[::-1]:
                print(f"{k} was used {v} times")

    except FileNotFoundError:
        if platform == 'linux':
            return print("No file '.bash_history' was found in home directory")
        if platform == 'darwin':
            return print("No file '.bash_history' was found in users directory")


bash_history()

