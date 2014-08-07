package Perfect::Hash::CMPH::BDZ;

our $VERSION = '0.01';
use strict;
use Perfect::Hash::CMPH;
#use warnings;
our @ISA = qw(Perfect::Hash::CMPH Perfect::Hash);

=head1 DESCRIPTION

XS interface to the cmph-2.0 BDZ algorithm.
See http://cmph.sourceforge.net/chd.html

=head1 METHDOS

=over 4

=head1 new $filename, @options

Computes a minimal perfect hash table using the given dictionary,
given as hashref or arrayref or filename.

Honored options are: I<none>

=head1 perfecthash $obj, $key

Look up a $key in the minimal perfect hash table
and return the associated index into the initially 
given $dict.

With -no-false-positives it checks if the index is correct,
otherwise it will return undef.
Without -no-false-positives, the key must have existed in
the given dictionary. If not, a wrong index will be returned.

=head1 false_positives

Returns 1 if the hash might return false positives,
i.e. will return the index of an existing key when
you searched for a non-existing key.

The default is 1, unless you created the hash with the
option C<-no-false-positives>.

=back

=cut

# local testing: p -d -Ilib lib/Perfect/Hash/CMPH/BDZ.pm examples/words20
unless (caller) {
  require Perfect::Hash;
  &Perfect::Hash::_test(@ARGV)
}

1;
