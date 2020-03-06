#!/bin/bash

ps uax --sort=start_time | tac | awk 'NR==1 {print $2}'
