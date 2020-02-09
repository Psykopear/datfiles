#!/bin/bash
systemctl --user unmask pulseaudio.socket
systemctl --user start pulseaudio.service
