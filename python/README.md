# Using Docker/Podman for Python courses

Follow these instructions for Beginning Python, Intro-DB, Advanced Python, Python Machine Learning, etc.

## Initial setup

Note that the initial setup may take some time to build docker image.

1. Create a course folder
    - e.g., `Users/<username>/<semester>/<course>`
    - `Users/rbasnet/fall2023/beg-python`
    - NOTE - course folder must be lowercase as it's the name used for docker image

2. Copy all the files from python folder into your course folder

3. Using a Terminal (git-bash on Windows):

    - change working directory to your course folder
    
    ```bash
    $ cd <Users/rbasnet/fall2023/beg-python>
    $ pwd
    $ ls
    ```
    - run the run.sh script using bash program

    ```bash
    $ bash run.sh
    ```
    - if all goes well, you'll see a Ubuntu Bash Terminal
    - type the following for a quick test:

    ```bash
    $ uname -a
    $ pwd
    $ ls
    $ sqlite3 --version
    $ python --version
    $ python hello.py
    ```

4. Clone the course jupyter notebook repository

## Run Jupyter Notebook server

1. Open a Terminal (git-bash on Windows)
2. Change current working directory to your course folder
  
  ```bash
  $ cd <course folder>
  ```

3. Run run-jupyter.sh script

  ```bash
  $ bash run-jupyter.sh
  ```

4. Press Ctrl+C to quit the jupyter notebook server
