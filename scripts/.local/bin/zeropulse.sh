#!/bin/bash

systemctl --user mask pulseaudio.socket #unmask to revert
systemctl --user stop pulseaudio.service
