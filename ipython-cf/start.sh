#!/bin/bash
trap "" SIGTTIN
trap "" SIGTTOU
ipython notebook --ip='*' --port=8080
