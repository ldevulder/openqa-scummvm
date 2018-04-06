# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: start ScummVM game engine (v2 version)
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;
use utils 'assert_gui_app';

sub run {
    # With assert_gui_app, we can directly install and execute ScummVM!
    assert_gui_app 'scummvm', install => 1, remain => 1;

    # Wait for ScummVM to be started
    assert_screen 'scummvm-main-menu';
    save_screenshot;
}

1;
# vim: set sw=4 et:
