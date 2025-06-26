#!/bin/bash

gdbus emit \
  --system \
  --object-path /org/freedesktop/login1 \
  --signal org.freedesktop.login1.Manager.PrepareForSleep \
  true

systemctl hibernate
