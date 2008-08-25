package Sub::SingletonBuilder;

use strict;
use warnings;

use base qw/Exporter/;

our @EXPORT = qw/build_singleton/;
our $VERSION = '0.01';

sub build_singleton {
    my $ctor = shift;
    my $instance = undef;
    sub {
        if (@_) {
            $instance = $_[0];
        } else {
            $instance ||= $ctor->();
        }
    };
}

1;
__END__

=head1 NAME

Sub::SingletonBuilder - a singleton subroutine builder

=head1 SYNOPSIS

  use Sub::SingletonBuilder;
  
  *dbh = build_singleton(sub {
      DBI->connect(...);
  });
  
  dbh()->execute(...);

=head1 AUTHOR

Kazuho Oku

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Cybozu Labs, Inc.

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself, either Perl version 5.8.6 or, at your option, any later version of Perl 5 you may have available.

=cut
