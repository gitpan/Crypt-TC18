use diagnostics;
use strict;
use warnings;
use Test::More tests => 2;
BEGIN {
    use_ok('Crypt::TC18')
};

BEGIN {
    my $key = pack "H16", "0001020304050607";
    my $cipher = new Crypt::TC18 $key;
    my $ciphertext = pack "H32", "479e3a9947168262855b5719a8dbc382";

    my $plaintext = $cipher->decrypt($ciphertext);
    my $answer = unpack "H*", $plaintext;
    is("000102030405060708090a0b0c0d0e0f", $answer);
};

