#!/usr/bin/env perl
use strict;
use warnings;

use URI;
use HTML::TreeBuilder::XPath;
use Getopt::Long;

my %opts;
GetOptions(
    "text=s"  => \$opts{text},
    "font=s"  => \$opts{font},
);

our @FONTS = qw(
    bigchief
    block
    big
    epic
    fuzzy
    fourtops
    fender
    gothic
    graffiti
    hollywood
    invita
    isometric1
    isometric2
    isometric3
    isometric4
    italic
    jazmine
    kban
    larry3d
    lcd
    lean
    letters
    linux
    lockergenome
    madrid
    marque
    maxfour
    mike
    mini
    ogre
    pawps
    peaks
    pebbles
);

die "text not specified" unless $opts{text};

print generate_ascii($opts{text}, $opts{font}) . "\n";

sub generate_ascii {
    my $text = shift;
    my $font = shift ||'epic';

    $font  = $FONTS[rand @FONTS] if $opts{font} && $opts{font} eq 'random';
    $font  = 'epic' unless grep { /$font/ } @FONTS;

    my $uri = URI->new('http://www.network-science.de/ascii/ascii.php');
    $uri->query_form(
        TEXT => $text,
        x    => 44,
        y    => 13,
        FONT => $font,
        RICH => 'no',
        FORM => 'left',
        STRE => 'no',
        WIDT => 80,
    );

    my $tree    = HTML::TreeBuilder::XPath->new_from_url($uri->as_string);
    my ($ascii) = $tree->findvalues('.//table[@width]//pre');
    return $ascii;
}
