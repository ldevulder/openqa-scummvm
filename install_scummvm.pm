# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: install the ScummVM game engine
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;
use utils 'zypper_call';

sub run {
    # Execute xterm as root user
    x11_start_program 'xterm';
    become_root;

    # Install ScummVM using the zypper_call function
    zypper_call 'in scummvm';

    # Close the xterm console
    wait_screen_change { send_key 'alt-f4'; };
}

1;
# vim: set sw=4 et:
