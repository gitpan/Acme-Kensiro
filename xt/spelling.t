use strict;
use Test::More;
use File::Spec;
eval q{ use Test::Spellunker };
plan skip_all => "Test::Spellunker is not installed." if $@;

plan skip_all => "no ENV[HOME]" unless $ENV{HOME};
my $spelltest_switchfile = ".spellunker.en";
plan skip_all => "no ~/$spelltest_switchfile" unless -e File::Spec->catfile($ENV{HOME}, $spelltest_switchfile);

add_stopwords('Acme-Kensiro');
add_stopwords(qw(otsune tokuhirom tokuhirom));

all_pod_files_spelling_ok('lib');
