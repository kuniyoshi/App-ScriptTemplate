#!/usr/bin/perl

use strict;
use warnings;
use App::ScriptTemplate;
use Path::Class qw( dir );
use File::HomeDir;

my $template = App::ScriptTemplate->new;

foreach my $script ( $template->scripts ) {
    my $file = dir( File::HomeDir->my_home, "bin" )->file( $script->name );
    print { $file->openw } $script->code;
    chmod 0744, $file->absolute
        or die "Could not change mode.[$!]";
}

