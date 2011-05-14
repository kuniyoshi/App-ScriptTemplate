package App::ScriptTemplate;

use strict;
use warnings;
use Carp qw( croak );

our $VERSION = '0.01';

our @MODULES = map { join q{::}, __PACKAGE__, "Script", $_ } qw(
    trim
);

sub new { bless { }, shift }

sub get_script {
    my $self   = shift;
    my $module = shift
        or croak "Module name required.";

    eval "require $module"
        or die "Could not load module $module";

    return $module->new;
}

sub scripts {
    my $self = shift;
    return map { $self->get_script( $_ ) } @MODULES;
}

1;
__END__

=head1 NAME

App::ScriptTemplate - a distribution for Perl script

=head1 SYNOPSIS

  use App::ScriptTemplate;
  use Path::Class qw( dir );
  use File::HomeDir;

  my $template = App::ScriptTemplate->new;

  foreach my $script ( $template->scripts ) {
      my $FH = dir( File::HomeDir->my_home, "bin" )->file( $script->name )->openw;
      print { $FH } $script->code;
      close $FH
          or die "Could not print to file.";
  }

=head1 DESCRIPTION

App::ScriptTemplate is a Template distribution.
This collects perlscripts.

=head1 AUTHOR

kuniyoshi kouji E<lt>kuniyoshi@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
