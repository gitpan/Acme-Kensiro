use strict;
use Module::Build;
use 5.008001;

my $builder = Module::Build->new(%{
{
  'build_requires' => {
                        'Test::More' => '0.98'
                      },
  'module_name' => 'Acme-Kensiro',
  'recursive_test_files' => 1,
  'dynamic_config' => 0,
  'configure_requires' => {
                            'Module::Build' => '0.40'
                          },
  'dist_name' => 'Acme-Kensiro',
  'requires' => {
                  'Exporter' => '5.62',
                  'perl' => '5.010001'
                },
  'create_readme' => 1,
  'no_index' => {
                  'directory' => [
                                   'inc'
                                 ]
                },
  'dist_version' => bless( {
                             'original' => '0.09',
                             'version' => [
                                            0,
                                            90
                                          ]
                           }, 'version' ),
  'license' => 'Perl_5',
  'test_files' => 't/',
  'script_files' => []
}

});
$builder->create_build_script();
