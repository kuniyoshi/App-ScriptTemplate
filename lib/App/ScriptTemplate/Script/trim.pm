package App::ScriptTemplate::Script::trim;

use strict;
use warnings;
use base "App::ScriptTemplate::Script";

sub code {
    my $self = shift;
    return <<'PERL';
#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {
    chomp( my $line = $_ );
    $line =~ s{\A \s* }{}msx;
    $line =~ s{ \s* \z}{}msx;
    print $line, "\n";
}

exit;
PERL
}

1;

