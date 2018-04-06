# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: prepare the VM
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;
use utils 'pkcon_quit';

sub run {
    # Select x11 console (just to be sure)
    select_console 'x11';

    # Sometimes the mouse cursor can disturb the assert_* mechanism
    mouse_hide;

    # Execute xterm as root user
    x11_start_program 'xterm';
    become_root;

    # Deactivate PackageKit, we don't want to have a warning screen about needed updates :)
    pkcon_quit;

    # Close the xterm console
    wait_screen_change { send_key 'alt-f4'; };
}

1;
# vim: set sw=4 et:
