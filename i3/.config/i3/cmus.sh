#!/bin/bash

while ( ! pgrep urxvtd ); do
    sleep 1
done
exec urxvtc -e cmus
