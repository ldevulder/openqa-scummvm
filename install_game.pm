# SUSE's openQA tests
#
# Copyright (c) 2018 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

# Summary: install the game
# Maintainer: Loic Devulder <ldevulder@suse.com>

use base 'opensusebasetest';
use strict;
use testapi;

sub run {
    my $timeout      = 300;    # Max waiting time
    my $download_dir = '~/Downloads';
    my $install_dir  = '~/Games';
    my $game_url     = 'http://scummvm.org/frs/extras/Beneath%20a%20Steel%20Sky/bass-cd-1.2.zip';
    my $game_file    = "$download_dir/bass.zip";

    # Select x11 console (just to be sure)
    select_console 'x11';

    # Execute xterm as normal user
    x11_start_program 'xterm';

    # Create the needed directories
    assert_script_run "mkdir -p $download_dir $install_dir";

    # Get the game
    assert_script_run "wget -c $game_url -O $game_file", timeout => $timeout;

    # Install the game
    assert_script_run "unzip $game_file -d $install_dir", timeout => $timeout;

    # Close the xterm console
    wait_screen_change { send_key 'alt-f4'; };
}

1;
# vim: set sw=4 et:
