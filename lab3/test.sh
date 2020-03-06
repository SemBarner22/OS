#!/bin/bash

ps -u | awk '{G="/proc/"; print $G}'

