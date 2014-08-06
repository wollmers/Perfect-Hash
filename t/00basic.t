#!/usr/bin/perl -w
use Test::More;
use Perfect::Hash;

my @methods = sort keys %Perfect::Hash::algo_methods;
my @opts = ();
if (@ARGV and grep /^-/, @ARGV) {
  my @m = ();
  for (@ARGV) {
    my ($m) = /^-(.*)/;
    if (exists $Perfect::Hash::algo_methods{$m}) {
      push @m, $_;
    } else {
      push @opts, $_;
    }
  }
  @methods = @m if @m;
} else {
  @methods = ("", map {"-$_"} @methods);
}
plan tests => scalar(@methods);

my %dict = map {chr $_ => $_-48} (48..125);
delete $dict{'\\'};
for my $m (@methods) {
  my $ph = new Perfect::Hash \%dict, $m, @opts;
  unless ($ph) {
    ok(1, "SKIP empty ph $m");
    next;
  }
 TODO: {
   local $TODO = "$m" if exists $Perfect::Hash::algo_todo{$m};
   my $ok = 1;
   for my $w (sort keys %dict) {
     my $o = ord $w;
     my $v = $ph->perfecthash($w);
     $ok = 0 if $v != $o - 48;
     unless ($ok) {
       is($v, $o - 48, "method '$m' for '$w' => $v");
       last;
     }
   }
   $ok ? ok($ok, "method '$m'") : 0;
  }
}
