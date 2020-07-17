#!/usr/bin/env python3

import os
import requests  # noqa We are just importing this to prove the dependency installed correctly
from github3 import login


def main():
    token = os.environ["INPUT_REPOTOKEN"]
    client = login(token=token)
    # my_input = os.environ["INPUT_MYINPUT"]

    my_output = f"Hello! I am {client}"

    print(f"::set-output name=myOutput::{my_output}")


if __name__ == "__main__":
    main()
