package App::ScriptTemplate::Script;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $name  = $class;
    $name =~ s{\A .* [:]{2} }{}msx;

    return bless { name => $name }, $class;
}

sub name { shift->{name} }

1;
__END__

=head1 NAME

App::ScriptTemplate::Script - 

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 AUTHOR

kuniyoshi kouji E<lt>kuniyoshi@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

