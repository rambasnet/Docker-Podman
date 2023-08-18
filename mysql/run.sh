#/bin/bash

# get directory of this script
# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! cd "$SCRIPT_DIR"
then
  echo "Could not change directory to script directory '$SCRIPT_DIR'"
  exit 1
fi
echo "Working directory is $SCRIPT_DIR"

windows() {
  if which cygpath > /dev/null # git-bash/msys/cygwin
  then
	  return 0
  fi
  if [ -r /proc/version ] && grep -q Microsoft /proc/version
  then
	  return 0
  fi
    return 1
}

winenv() {
  if windows
    then
	winpty "$@"
    else
	"$@"
    fi
}

# Try to convert for big-bash/msys/cygwin/wsl...
winpath() {
  if which cygpath > /dev/null # git-bash/msys/cygwin
  then
    cygpath -w "$@"
  elif [ -r /proc/version ] && grep -q Microsoft /proc/version
  then
	  echo readlink -m "$@" | sed 's|^/mnt/\([a-z]\)|\U\1:|' | sed 's|/|\\|g'
  else
	  echo "$@"
  fi
}

# use the directory name as the tag name for docker
DOCKER_TAG=$(basename "$SCRIPT_DIR")

# Host (source) directory to mount in container
HOST_DIR="$(winpath "$SCRIPT_DIR")"

# Guest (target) directory where directoy is mounted
GUEST_DIR=/app

if [ ! -f Dockerfile ]
then
  echo "'$SCRIPT_DIR' does not contain a Dockerfile."
  exit 1
fi

echo "podman build '$SCRIPT_DIR/Dockerfile' with tag '$DOCKER_TAG'..."
if docker build -t "$DOCKER_TAG" .
then
  echo "podman build ok."
else
  echo "podman build failed."
  exit 1
fi
mkdir -p "$HOST_DIR/data"
echo "podman run '$DOCKER_TAG' (mounting host '$HOST_DIR/data' as '$GUEST_DIR'): " "$@"
if [ $# -gt 0 ]
then
  winenv podman run -d \
    -v "$HOST_DIR/data:$GUEST_DIR" \
    -p 3306:3306 \
    --name mysql_db \
    --env="MYSQL_ROOT_PASSWORD=toor" \
    "$DOCKER_TAG"
else
  echo "Type CTRL-D or exit to exit the interactive shell"
  winenv podman run -d \
    -v "$HOST_DIR/data:$GUEST_DIR" \
    -p 3306:3306 \
    --name mysql_db \
    --env="MYSQL_ROOT_PASSWORD=toor" \
    "$DOCKER_TAG"
fi