#!/bin/bash

EXIT_STATUS=0

if ! make black ARGS=--check ; then
  echo "Please run command 'make black' on your local and commit the result"
  EXIT_STATUS=1
fi
if ! make isort ARGS=--check-only ; then
  echo "Please run command 'make isort' on your local and commit the result"
  EXIT_STATUS=1
fi

if ! make pylint ARGS=--errors-only ; then
  echo "Please run command 'make pylint' on your local and fix errors"
  EXIT_STATUS=1
fi

if ! make unittest ; then
  EXIT_STATUS=1
fi

if ! make mypy ; then
  EXIT_STATUS=1
fi

exit $EXIT_STATUS
