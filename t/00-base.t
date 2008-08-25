use Test::More tests => 6;

use strict;
use warnings;

use_ok('Sub::SingletonBuilder');

my $c = 1;
my $f = build_singleton(sub { $c++ });

ok(ref $f);
is($f->(), 1);
is($f->(), 1);
is($f->(undef), undef);
is($f->(), 2);
