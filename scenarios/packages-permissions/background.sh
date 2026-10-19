#!/usr/bin/env bash
# ==============================================================================
# Background initialization script for Killercoda Week 2 Lab
# ==============================================================================

# Ensure lock state is enforced until student logs in
touch /tmp/.jarvis_locked
rm -f /tmp/.jarvis_unlocked

# Update package index in the background to accelerate student apt commands
apt-get update -y > /dev/null 2>&1

# Signal background completion
touch /tmp/.background_finished

