#!/bin/bash

if lsmod | grep -q acpi_call; then
    echo "\_SB.PCI0.PEG0.PEGP._OFF" | sudo tee /proc/acpi/call
    result=$(sudo cat /proc/acpi/call)
    case "$result" in
        Error*)
            echo "Error while turning GPU off"
            ;;
        *)
            echo "GPU turned off!"
            ;;
    esac

else
    echo "The acpi_call module is not loaded, try running 'modprobe acpi_call' or 'insmod acpi_call.ko' as root"
    exit 1
fi
