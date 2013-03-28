use strict;
use Test::More;
use File::Spec;
eval q{ use Test::Spelling };
plan skip_all => "Test::Spelling is not installed." if $@;
eval q{ use Pod::Wordlist::hanekomu };
plan skip_all => "Pod::Wordlist::hanekomu is not installed." if $@;

plan skip_all => "no ENV[HOME]" unless $ENV{HOME};
plan skip_all => "no ~/.aspell.en.pws" unless -e File::Spec->catfile($ENV{HOME}, '.aspell.en.pws');

add_stopwords('Acme-Kensiro');

$ENV{LANG} = 'C';
my $has_aspell;
foreach my $path (split(/:/, $ENV{PATH})) {
    -x "$path/aspell" and $has_aspell++, last;
}
plan skip_all => "no aspell" unless $has_aspell;
plan skip_all => "no english dict for aspell" unless `aspell dump dicts` =~ /en/;

set_spell_cmd('aspell list -l en');
all_pod_files_spelling_ok('lib');
