# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: add the game
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;

sub run {
    # To be sure that ScummVM is started
    assert_screen 'scummvm-main-menu';

    # Add the game
    assert_and_click 'scummvm-select-add-game';
    assert_screen 'scummvm-add-game';
    assert_and_dclick 'scummvm-select-game-directory';
    assert_and_dclick 'scummvm-select-bass-directory';
    assert_and_click 'scummvm-select-choose';
    assert_and_click 'scummvm-select-graphics';
    assert_and_click 'scummvm-override-graphics-settings';
    assert_and_click 'scummvm-select-graphic-mode';
    assert_and_click 'scummvm-select-enhanced-mode';
    assert_and_click 'scummvm-select-fullscreen-mode' if get_var 'SCUMMVM_FULLSCREEN';
    assert_and_click 'scummvm-select-ok';
    assert_screen 'scummvm-bass-game';
    save_screenshot;
}

1;
# vim: set sw=4 et:
