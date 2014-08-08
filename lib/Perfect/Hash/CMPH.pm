package Perfect::Hash::CMPH;

our $VERSION = '0.01';
use strict;
#use warnings;
our @ISA = qw(Perfect::Hash);

use XSLoader;
XSLoader::load('Perfect::Hash::CMPH');

=head1 DESCRIPTION

XS interface to the cmph library, the current state of the art library
for perfect hashes and minimal perfect hashes.

L<http://cmph.sourceforge.net>

=head1 METHODS

=head2 new $filename, @options

filename only so far

=cut

# TODO support arrayref and hashref converted to arrayrefs, as byte-packed vector
# for the cmph io_vector or io_byte_vector adapter.
sub new {
  return _new(@_);
}

=head2 perfecthash $ph

XS method

=head2 false_positives

Returns 0, as cmph hashes always store the keys.

=head2 save_c NYI

=cut

sub false_positives {
  return 0
}

sub save_c { warn "save_c NYI" }

=head1 LICENSE

The code of the cmph library and this perl library is dual licensed under
the B<LGPL version 2> and B<MPL 1.1> licenses. Please refer to the LGPL-2
and MPL-1.1 files in the F<cmph> subdirectory for the full description of
each of the licenses.

For cxxmph, the files F<stringpiece.h> and F<MurmurHash2> are covered by the
BSD and MIT licenses, respectively.

=cut

1;
