import os
import time

from subprocess import Popen, PIPE


BASE_DIR = '/home/docler/src/sclang'
INIT_DATA = ''''''


def is_zero_file(fpath):
    return not os.path.isfile(fpath) or os.path.getsize(fpath) == 0


if __name__ == '__main__':
    env = os.environ.copy()
    timestr = time.strftime("%Y-%m-%d")
    filename = f'{BASE_DIR}/{timestr}.sc'

    if is_zero_file(filename):
        with open(filename, 'w') as f:
            f.write(INIT_DATA)

    # Open emacs starting sclang right away
    os.chdir(BASE_DIR)
    Popen(
        ["/usr/bin/emacs", "-sclang", filename],
        stdout=PIPE,
        stdin=PIPE,
        env=env,
        bufsize=1,
        universal_newlines=True,
    )
