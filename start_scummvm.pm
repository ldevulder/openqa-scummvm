# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: start ScummVM game engine (v1 version)
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;

sub run {
    # Execute ScummVM as normal user
    x11_start_program 'scummvm';
    save_screenshot;
}

1;
# vim: set sw=4 et:
