# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: test the game
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;

sub run {
    my $timeout   = 400;    # Max waiting time
    my $s_timeout = $timeout / 4;

    # Start the game
    wait_screen_change { assert_and_dclick 'scummvm-start-bass'; };

    # If wanted, we can skip the intro
    send_key 'esc' if get_var 'BASS_SKIP_INTRO';

    # Wait for the main screen
    # Big timeout, as we may need to wait for the intro to finish!
    assert_screen 'scummvm-bass-main-screen', $timeout;
    save_screenshot;

    # Move the avatar, play the game, to show that openQA can do it!

    # First part
    mouse_set 75, 235;
    mouse_click 'right';
    wait_still_screen;
    mouse_set 120, 30;
    assert_screen 'scummvm-bass-item-screen';
    mouse_set 120, 60;
    mouse_click 'right';
    wait_still_screen;
    mouse_set 835, 215;
    mouse_click;
    assert_screen 'scummvm-bass-second-screen', $s_timeout;
    save_screenshot;

    # Second part
    mouse_set 190, 250;
    mouse_click 'right';
    wait_still_screen;
    mouse_click;
    assert_screen 'scummvm-bass-first-screen';
    save_screenshot;

    # Third part
    mouse_set 460, 470;
    mouse_click;
    wait_still_screen;
    mouse_set 815, 420;
    mouse_click;
    assert_screen 'scummvm-bass-third-screen';
    save_screenshot;

    # Close ScummVM
    wait_screen_change { send_key 'f5'; };
    assert_and_click 'scummvm-bass-quit';
    assert_screen 'scummvm-bass-quit-screen';
    assert_and_click 'scummvm-bass-confirm-quit';
    assert_screen 'main-windows';
    save_screenshot;
}

1;
# vim: set sw=4 et:
