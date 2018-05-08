#!/bin/bash
echo "Creating SSH Tunnel"
autossh -M 10984 -N -f -o "PubkeyAuthentication=yes" -o "PasswordAuthentication=no" -L 8081:localhost:8081 fitnesslab@192.168.189.181
echo "Done!"
